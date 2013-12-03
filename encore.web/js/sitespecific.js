/************************************************************************
*
* For CSS purposes it can be very useful to add a 'hasJS' class to the HTML
* element allowing different styling options when JavaScript is enabled
*
*************************************************************************/
if (document.getElementsByTagName('html')[0].className.indexOf("hasJS") == -1) {
    document.getElementsByTagName('html')[0].className += " hasJS";
}

/************************************************************************
* Check if namespace already exists
*************************************************************************/
if (!ceh) { var ceh = {}; }


/************************************************************************
* Object
*************************************************************************/
ceh.encore = function () {
    var self = this;
    this.debugErrors = false;

    /************************************************************************
    * Constructor
    *************************************************************************/
    this.init = function () {
        $(document).ready(function () {
            self.ready();
        });
    };

    /************************************************************************
    * Once jquery is intialised
    *************************************************************************/
    this.ready = function () {
        self.debug("jquery ready");
        self.progressiveEnhancement();
        self.setupTabs();
        self.setupButtonTest();
    };

    /************************************************************************
    * some javascript progressive enhancement
    *************************************************************************/
    this.progressiveEnhancement = function () {

        $('input.field,select.field, textarea.field').focus(function (e) {
            if ($(this).parent().children('.contexthelp')) {
                $(this).parent().children('.contexthelp').css("top", $(this).position().top - 20);
                $(this).parent().children('.contexthelp').css("left", $(this).width() + 40);
                $(this).parent().children('.contexthelp').css("margin-left", 0);

                if ($(this).offset().left + $(this).width() + $(this).parent().children('.contexthelp').width() >= $(window).width()) {
                    $(this).parent().children('.contexthelp').css("left", 0);
                    $(this).parent().children('.contexthelp').css("margin-left", 0 - ($(this).parent().children('.contexthelp').width() + 40));

                    $(this).parent().children('.contexthelp').children('div').removeClass("arrow");
                    $(this).parent().children('.contexthelp').children('div').addClass("arrowr");
                }
                else {
                    $(this).parent().children('.contexthelp').children('div').removeClass("arrowr");
                    $(this).parent().children('.contexthelp').children('div').addClass("arrow");
                }

                $(this).parent().children('.contexthelp').fadeIn();
            }
        });

        $('input.field, select.field, textarea.field').blur(function () {
            $(this).parent().children('.contexthelp').fadeOut();
        });

        $('.contexthelp').append('<div class="arrow"></div>');

        $(".datepicker").datepicker({ dateFormat: 'dd-mm-yy' });

        $(".pagedcontent").quickPager();

        $('.lightbox').openDOMWindow({ height: 400, width: 700, eventType: 'click', windowSource: 'iframe', windowPadding: 8, loader: 1,
            loaderImagePath: '/encore/css/img/loading.gif', loaderHeight: 16, loaderWidth: 17
        });
    },

    /************************************************************************
    * Setup project URL test
    *************************************************************************/
     this.setupButtonTest = function () {
         $("#MainContent_MainContent_btnTest").click(function () {
             var api_url = $("#MainContent_MainContent_txtURL_txtTextBox").val();
             api_url = api_url + "/HelloWorld?callback=?&format=json";
             var timeout = 1000;
             var id = setTimeout(" $().toastmessage('showErrorToast', 'Could not connect to project - please check the URL and try again')", timeout);

             $.ajax({
                 type: "GET",
                 dataType: "jsonp",
                 url: api_url,
                 timeout : 10000,
                 success: function (msg) {
                    clearTimeout(id);
                    self.showToast("Success", "Connection made successfully: ");
                 }
             });

         });
     },

    /************************************************************************
    * Setup any tabs on the page
    *************************************************************************/
    this.setupTabs = function () {
        //When page loads...
        $(".tab_content").hide(); //Hide all content
        $("ul.tabs li:first").addClass("active").show(); //Activate first tab
        $(".tab_content:first").show(); //Show first tab content

        //On Click Event
        $("ul.tabs li").click(function () {

            $("ul.tabs li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            $(".tab_content").hide(); //Hide all tab content

            var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
            $(activeTab).show(); //Fade in the active ID content
            return false;
        });
    },

    /************************************************************************
    * Show toast popup window (success, fail, etc)
    *************************************************************************/
    this.showToast = function (toastType, toastMessage) {
        $().toastmessage('show' + toastType + 'Toast', toastMessage);
    },

    /************************************************************************
    * Show sticky toast popup window (success, fail, etc)
    *************************************************************************/
    this.showStickyToast = function (toastType, toastMessage) {
        $().toastmessage('showToast', {
            text: toastMessage,
            sticky: true,
            type: toastType.toLowerCase(),
            closeText: ''
        });
    },

    /************************************************************************
    * Allow for easy turning on/off of debugging information
    *************************************************************************/
    this.debug = function (myMessage) {
        if (this.debugErrors == true) {
            if ((typeof console != "undefined") && (typeof console.log == 'function')) {
                console.log(myMessage);
            }
            else {
                alert(myMessage);
            }
        }
    };


    /************************************************************************
    * Instantiate this Object
    *************************************************************************/
    this.init();
};


/************************************************************************
* Create an instance of the object so we can use it to access data.
*************************************************************************/
var Encore = new ceh.encore();