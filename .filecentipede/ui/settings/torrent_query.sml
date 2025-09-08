#servers
{
    text:"${server}"
    layout:VBoxLayout
}

Dialog#main
{
    title:"${torrent_query}"
    width:600
    height:400
    layout:VBoxLayout
    
    Tab#tabs
    {
        ${#servers}
    }
}  
 
