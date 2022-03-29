
#### 2、H+框架: 关闭新选项卡
```js
function closeActivePages() {
    var wpd = $(window.parent.document);
    var pageTabs = wpd.find(".J_menuTabs .page-tabs-content ");
    var i = pageTabs.find(".J_menuTab.active").find("i");
    i.click()
};
```

#### 1、H+框架: 打开新选项卡
```js
function addNewPages(url, title) {
    var wpd = $(window.parent.document);
    var mainContent = wpd.find(".J_mainContent");
    var thisIframe = mainContent.find("iframe[data-id='" + url + "']");
    var pageTabs = wpd.find(".J_menuTabs .page-tabs-content ");
    pageTabs.find(".J_menuTab.active").removeClass("active");
    mainContent.find("iframe").css("display", "none");
    if (thisIframe.length > 0) {
        thisIframe.css("display", "inline");
        pageTabs.find(".J_menuTab[data-id='" + url + "']").addClass("active")
    } else {
        var menuItem = wpd.find("a.J_menuItem[href='" + url + "']");
        var dataIndex = title == undefined ? menuItem.attr("data-index") : "9999";
        var _title = title == undefined ? menuItem.find(".nav-label").text() : title;
        var iframe = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + url + '" frameborder="0" data-id="' + url + '" seamless="" style="display: inline;"></iframe>';
        pageTabs.append(' <a href="javascript:;" class="J_menuTab active" data-id="' + url + '">' + _title + ' <i class="fa fa-times-circle"></i></a>');
        mainContent.append(iframe);
        var loading = top.layer.load();
        mainContent.find("iframe:visible").load(function() {
            top.layer.close(loading)
        })
    }
};
```