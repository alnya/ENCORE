using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Security;
using System.Security.Permissions;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace com.Encore.jControls
{
    [ParseChildren(true),
    ToolboxData("<{0}:jGrid runat=\"server\"> </{0}:jGrid>")]
    public class jGrid : WebControl
    {
        private List<jGridColumn> _cols;

        public String DataURL { get; set; }
        public String RowClickURL { get; set; }
        public String Title { get; set; }
        public int PageSize { get; set; }

        [PersistenceMode(PersistenceMode.InnerProperty)]
        public List<jGridColumn> Columns
        {
            get
            {
                if (null == this._cols) { this._cols = new List<jGridColumn>(); }
                return _cols;
            }
        }

        protected override void RenderContents(HtmlTextWriter writer)
        {
            RegisterScript();

            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ID);
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "flexme");
            writer.AddAttribute(HtmlTextWriterAttribute.Style, "display: none");
            writer.RenderBeginTag(HtmlTextWriterTag.Table);
            writer.RenderEndTag();

            base.RenderContents(writer);
        }

        private void RegisterScript()
        {
            // build Jquery table
            var js = new StringBuilder();

            js.Append("<script>$('#" + this.ID + "').flexigrid({");
            js.Append("url: '");
            js.Append(DataURL);
            js.Append("',");
            js.Append("dataType: 'json',");
            js.Append("colModel : [");

            // todo columns

            var c = 0;
            foreach (var col in _cols)
            {
                js.Append("{display: '" + col.Title.Replace("'", "\'") + "', name : '" + col.ColumnName + "', width : '" + col.Width.Value.ToString() + "', sortable : '" + col.Sortable.ToString() + "', align: '" + col.Align + "'}");
                if (c != _cols.Count - 1)
                    js.Append(",");
                c++;
            }

            js.Append("		],");
            js.Append("	buttons : [");
            //js.Append("		{name: 'Add', bclass: 'add', onpress : test},");
            //js.Append("		{name: 'Delete', bclass: 'delete', onpress : test},");
            //js.Append("		{separator: true}");
            js.Append("],");
            if (_cols.FindAll(sc => sc.Searchable).Count > 0)
            {
                js.Append("searchitems : [");
                c = 0;
                foreach (var col in _cols)
                {
                    if (col.Searchable)
                    {
                        js.Append("{display: '" + col.Title.Replace("'", "\'") + "', name : '" + col.ColumnName + "'}");
                        if (c != _cols.FindAll(sc => sc.Searchable).Count - 1)
                            js.Append(",");
                        c++;
                    }
                }
                js.Append("],");
            }
            js.Append("sortname: '" + _cols.FindAll(sc => sc.Sortable)[0].ColumnName + "',");
            js.Append("sortorder: 'asc',");
            js.Append("usepager: true,");
            js.Append("title: '");
            js.Append(Title.Replace("'", "''"));
            js.Append("',");
            js.Append("useRp: true,");
            js.Append("rp: ");
            js.Append(PageSize == 0 ? "15" : PageSize.ToString());
            js.Append(",showTableToggleBtn: true,width: ");
            js.Append(Width.Value);
            js.Append(",");
            js.Append("	height:");
            js.Append(Height.Value);
            js.Append("});");
            if (!string.IsNullOrEmpty(RowClickURL))
            {
                js.Append("$('#" + this.ID +
                          "').click(function(event){$('.trSelected', this).each( function(){ location.href='" + RowClickURL + "?ID=' + $(this).attr('id').substr(3);});});");
            }
            js.Append("</script>");
            this.Page.RegisterStartupScript("flexgrid", js.ToString());
        }
    }

    public class jGridColumn
    {
        public jGridColumn()
        {
            Sortable = true;
            Align = TextAlign.Left;
        }

        public string Title { get; set; }
        public string ColumnName { get; set; }
        public Unit Width { get; set; }
        public bool Sortable { get; set; }
        public bool Searchable { get; set; }
        public TextAlign Align { get; set; }
    }

    public class FlexigridViewData
    {
        public int page;
        public int total;
        public List<FlexigridRow> rows = new List<FlexigridRow>();
    }

    public class FlexigridRow
    {
        public long id;
        public List<string> cell;
    }
}