#introduction
{
    text:"${introduction}"
    icon:"icons/16/about.svg"
    layout:VBoxLayout
    
    Edit{
        viewonly:true
        "${browsers_extension_introduction_}<br/>
        <h3>${screenshot}:</h3>
        <br/><br/><img src='images/browser/extension_video_bar.png'/>
        <br/><br/><img src='images/browser/extension_videos.png'/> 
        <br/><br/><img src='images/browser/extension_audios.png'/> 
        "
    }
}

#firefox
{
    text:"Firefox"
    icon:"icons/firefox.png"
    layout:VBoxLayout
    
    Edit{
        viewonly:true
    
"<h4>${online_install}:</h4>
<br/><a href='https://addons.mozilla.org/firefox/addon/filecxx/'>https://addons.mozilla.org/firefox/addon/filecxx/</a><br/><br/>
${browsers_extension_firefox_} (${cache})<br/>
<h4>${open}:</h4> about:addons
<br/><br/><img src='images/browser/firefox_addons.png'/>

<br/><br/>${drop} ${__workspace__}browser_extensions firefox.xpi ${file} ${into}
<br/><br/><img src='images/browser/firefox_addons_drop.png'/>
<br/><br/><img src='images/browser/firefox_addons_add.png'/>
"

    }
}

#edge
{
    text:"Edge"
    icon:"icons/edge.png"
    layout:VBoxLayout
    
    Edit{
        viewonly:true
"<h4>${online_install}:</h4>
<br/><a href='https://microsoftedge.microsoft.com/addons/detail/jeekmibdibcjeihbjnjgbegjalfelhon'>https://microsoftedge.microsoft.com/addons/detail/jeekmibdibcjeihbjnjgbegjalfelhon</a><br/><br/>
<h4>${open}:</h4> edge://extensions/
<br/><br/><img src='images/browser/edge_menu.png'/>

<br/><br/>${enable} ${developer_mode}
<br/><br/><img src='images/browser/edge_extension_dev_mode.png'/>

<br/><br/>${drop} ${__workspace__}browser_extensions chrome.crx ${file} ${into}
<br/><br/><img src='images/browser/edge_drop.png'/>

"
    }
}

#chrome
{
    text:"Chrome"
    icon:"icons/chrome.png"
    layout:VBoxLayout
    
    Edit{
        viewonly:true

"${browsers_extension_chrome_}
<h4>${open}:</h4> chrome://extensions/

<br/><br/><img src='images/browser/chrome_menu.png'/>
<br/><br/><img src='images/browser/chrome_menu2.png'/>

<br/><br/>${enable} ${developer_mode}
<br/><br/><img src='images/browser/chrome_extension_dev_mode.png'/>

<br/><br/>${drop} ${__workspace__}browser_extensions chrome.crx ${file} ${into}
<br/><br/><img src='images/browser/chrome_drop.png'/>

<h3>${or}:</h3>
${unzip} chrome.zip
<br/><br/><img src='images/browser/chrome_unzip.png'/>

<br/><br/>${load_unpacked} <b></b>
<br/><br/><img src='images/browser/chrome_load_unpacked.png'/>
"
    }
}


Dialog#main
{
    title:"Web ${browsers}"
    layout:VBoxLayout
    w:740
    h:450
    
    Tab{
        ${#introduction}
        ${#edge}
        ${#firefox}
        ${#chrome}
    }
    Button{
        icon:"icons/16/directory.svg"
        text:"${open_browser_extensions_dir}"
        click:$open-local-url("${__workspace__}browser_extensions")
    }
}
 
