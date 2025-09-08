
Dialog#main
{
    title:"${software_name_}"
    class:ipc_loading
    layout:{
        type:VBoxLayout
        margin:30
        spacing:20
    }
    HBoxLayout
    {
        spacing:10
        Img{src:"ui/css/images/loading_ipc.gif"}
        
        "${upgrading_files_text_}....."
    }
}
