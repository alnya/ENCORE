using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace com.Encore.jControls
{
    [ToolboxData("<{0}:jSortable runat=\"server\"> </{0}:jSortable>")]
    public class jSortable : Panel, IPostBackDataHandler
    {
        public String DataURL { get; set; }
        public List<ListItem> SelectedItems = new List<ListItem>();
        public bool ValueChanged { get; set; }

        private string[] letters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
                     "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
                     "W", "X", "Y", "Z", "all"};

        ////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// Handle the PreRender event and register javascript      
        /// </summary>
        ////////////////////////////////////////////////////////////////////////////////
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (this.Page != null)
                this.Page.RegisterRequiresPostBack(this);
        }

        protected override void RenderContents(HtmlTextWriter writer)
        {
            // A workaround before finding a solution
            var hidden = new HiddenField {ID = UniqueID, Value = string.Empty};
            this.Controls.Add(hidden);
            
            writer.AddAttribute(HtmlTextWriterAttribute.Type, "hidden");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ID + "_value");
            writer.AddAttribute(HtmlTextWriterAttribute.Name, this.ID + "_value");
            writer.RenderBeginTag(HtmlTextWriterTag.Input);
            writer.RenderEndTag();

            writer.AddAttribute(HtmlTextWriterAttribute.Type, "hidden");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ID + "_text");
            writer.AddAttribute(HtmlTextWriterAttribute.Name, this.ID + "_text");
            writer.RenderBeginTag(HtmlTextWriterTag.Input);
            writer.RenderEndTag();

            writer.AddAttribute(HtmlTextWriterAttribute.Type, "hidden");
            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ID + "_changed");
            writer.AddAttribute(HtmlTextWriterAttribute.Name, this.ID + "_changed");
            writer.RenderBeginTag(HtmlTextWriterTag.Input);
            writer.RenderEndTag();

            writer.AddAttribute(HtmlTextWriterAttribute.Class, "atoz clearfix");
            writer.RenderBeginTag(HtmlTextWriterTag.Ul);
           
            foreach (var letter in letters)
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Li);

                writer.AddAttribute(HtmlTextWriterAttribute.Href, "#" + letter);
                writer.RenderBeginTag(HtmlTextWriterTag.A);
               
                writer.Write(letter);
                writer.RenderEndTag();
                writer.RenderEndTag();
            }
            writer.RenderEndTag();

            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ID + "_src");
            writer.AddAttribute(HtmlTextWriterAttribute.Class, CssClass + "list droplist panelscroll droplistsource");
            writer.RenderBeginTag(HtmlTextWriterTag.Ul);
            writer.RenderEndTag();

            writer.AddAttribute(HtmlTextWriterAttribute.Id, this.ID + "_selected");
            writer.AddAttribute(HtmlTextWriterAttribute.Class, CssClass + "list droplist panelscroll droplisttarget");
            writer.RenderBeginTag(HtmlTextWriterTag.Ul);

            foreach (var item in SelectedItems)
            {
                writer.AddAttribute(HtmlTextWriterAttribute.Id, item.Value);
                writer.RenderBeginTag(HtmlTextWriterTag.Li);
                writer.Write(item.Text);
                writer.RenderEndTag();
            }

            writer.RenderEndTag();

            base.RenderContents(writer);

            RegisterScript();
        }

        private void RegisterScript()
        {
            // some standard functions
            var js = new StringBuilder();
            js.Append("<script>function SetValues(list,ctrlID, m){var optionTexts = [];");
            js.Append("$('#' + ctrlID + '_selected li').each(function() { optionTexts.push($(this).text());});");
            js.Append("$('#' + ctrlID + '_value').val($(list).sortable('toArray').toString()).change();");
            js.Append("$('#' + ctrlID + '_text').val(optionTexts.join(',')).change();");
            js.Append("if (m) {$('#' + ctrlID + '_changed').val('y');}");
            js.Append("}</script>");

            this.Page.RegisterStartupScript("jSortable_func", js.ToString());

            js = new StringBuilder();
            js.Append("<script>function SearchValue(searchphrase){");
            js.Append("$('#" + this.ClientID + " .atoz a').removeClass('selected');");
            js.Append("$.getJSON('" + DataURL + "',{letter: searchphrase }, " +
                      "function(data) {" +
                      "var items = []; " +
                      "var currentlySelected = $('#" + ID + "_value').val().split(',');");
            js.Append("for (var i = 0, len = data.length; i < len; ++i)  { " +
                        "if (jQuery.inArray(data[i].Value,currentlySelected) < 0) { " +
                            "items.push('<li id=\"' + data[i].Value + '\">' + data[i].Name + '</li>');" +
                        "}" +
                      "}");
            js.Append("$('#" + ID + "_src').empty().append(items.join(''));" +
                      "});");

            js.Append("}</script>");

            this.Page.RegisterStartupScript("jSortable_search", js.ToString());

            // build Jquery table
            js = new StringBuilder();
            js.Append("<script>$(function() {");
            js.Append("$('#" + ID + "_selected').bind('sortcreate', function(event, ui) {SetValues(this,'" + ID + "',false);});");
            js.Append("$('#" + ID + "_src, #" + ID + "_selected').sortable({connectWith: '." + CssClass + "list'}).disableSelection();");
            js.Append("$('#" + ID + "_selected').bind('sortreceive', function(event, ui) {SetValues(this,'" + ID + "',true);});");
            js.Append("$('#" + ID + "_selected').bind('sortremove', function(event, ui) {SetValues(this,'" + ID + "',true);});");
            js.Append("$('#" + this.ClientID + " .atoz a').click(function(event){ event.preventDefault(); SearchValue($(this).attr('href').split('#')[1]); $(this).addClass('selected'); });");
            js.Append("SearchValue('all');"); // search all by default
            js.Append("});");
            js.Append("</script>");

            this.Page.RegisterStartupScript("jSortable_" + ID, js.ToString());

        }

        public bool LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection)
        {
            try
            {
                var itemValues = Page.Request[this.ID + "_value"];
                if (!string.IsNullOrEmpty(itemValues))
                {
                    var itemText = Page.Request[this.ID + "_text"].Split(',');
                    var itemVals = itemValues.Split(',');
                    for (int index = 0; index < itemVals.Length; index++)
                    {
                        var itemVal = itemVals[index];
                        var itemTxt = itemText[index];
                        SelectedItems.Add(new ListItem(itemTxt, itemVal));
                    }
                }
                ValueChanged = Page.Request[this.ID + "_changed"] == "y";
            }
            catch (Exception e)
            {
                string ex = e.Message;
                return false;
            }

            return true;
        }

        public void RaisePostDataChangedEvent()
        {

        }
    }
}
