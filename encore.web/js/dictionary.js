/************************************************************************
* Object
*************************************************************************/
var EncoreDictionary = {
    values: null,
    addUrl: null,

    Init: function (v, url) {
        values = v;
        addUrl = url;
        this.getLookupValues();
        $('.mappinglist li').click(EncoreDictionary.editor);
    },

    getLookupValues: function () {
        var maxWidth = 0;
        $('.mappinglist li').each(function () {
            var w = $(this).find(".src").width();
            var mapId = $(this).attr('map');
            if (w > maxWidth) { maxWidth = w; }
            if (mapId) {
                $(this).find(".map").html(EncoreDictionary.lookupValue(mapId));
            }
        });

        $('.src').css('width', maxWidth);
    },

    Save: function (projectId, encoreId) {

        var data = "{ fieldId:'" + projectId + "', encoreId:'" + encoreId + "'}";

        $.ajax({
            type: "POST",
            url: "fields.aspx/SaveField",
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                //TODO:
            },
            failure: function (errMsg) {
                alert(errMsg);
            }
        });
    },

    timer: null,

    Suggest: function () {
        var ctrl = $(this);
        ctrl.parent().find(".suggestions").remove();
        clearTimeout(EncoreDictionary.timer);
        ctrl.parent().find(".save").hide();

        var val = ctrl.val().toLowerCase();
        EncoreDictionary.timer = setTimeout(function () {
            var results = values;
            if (val.length > 2) {
                results = values.filter(function (item) {
                    return item.Name.toLowerCase().indexOf(val) == 0;
                });
            }
            EncoreDictionary.ShowSuggestions(ctrl, results);
        }, 1000);
    },

    ShowSuggestions: function (ctrl, results) {
        ctrl.parent().find(".suggestions").remove();
        var list = ctrl.parent().append("<ul class='suggestions'></ul>").find('ul');
        if (results.length > 0) {
            for (var i = 0; i < results.length; i++) {
                list.append("<li><a href='#' map='" + results[i].ID + "'>" + results[i].Name + "</a></li>");
            }
            list.find("a").click(function(e) {
                e.preventDefault();
                ctrl.val($(this).html());
                list.remove();
                EncoreDictionary.Save(ctrl.parent().parent().attr('id'), $(this).attr('map'));
            });
        }
        else {
            list.append("<li>No suggestions found</li>");
        }
    },

    editor: function () {
        if (!$(this).hasClass('editing')) {
            var v = $(this).find(".map").html();
            var original_name = $(this).find(".src").html();
            $(this).find(".map").attr('old', v);
            $(this).find(".map").html("<input type='text' class='field textfield medium' value='" + v + "'/>" +
                "<a href='" + addUrl + "?name=" + original_name + "' class='button search lightbox''>Add</a> " +
                "<a href='#' class='button delete'>X</a>");
            $(this).addClass('editing');
            $(this).find(".map .field").focus();
            $(this).find(".field").keypress(EncoreDictionary.Suggest);
            $(this).find(".delete").click(function (e) {
                e.preventDefault();
                var ctrl = $(this).parent();
                var val = $(this).find(".map").attr('old');
                ctrl.empty();
                ctrl.html(val);
                setTimeout(function () { ctrl.closest('li').removeClass('editing closing') }, 100);
            });

            $(this).find('.lightbox').openDOMWindow({ height: 400, width: 700, eventType: 'click', windowSource: 'iframe', windowPadding: 8, loader: 1,
                loaderImagePath: '/encore/css/img/loading.gif', loaderHeight: 16, loaderWidth: 17
            });
        }
    },

    lookupValue: function (id) {
        for (var i = 0; i < values.length; i++) {
            if (values[i].ID == id) return values[i].Name;
        }
        return null;
    }
};