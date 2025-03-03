#page_nfs
{
    text:"${settings}"
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${options}"
        layout:{
            type:GridLayout
            column:4
        }
    
        "${connect_timeout}:" SpinBox{
            name:connect_timeout
            value:5000
            min:1000
            max:120000
            step:1000
          
            suffix:ms
        }
        "${max_connections}:" SpinBox{
            name:max_connections
            min:1
            max:1024
            value:2
        }
    }
    GroupBox
    {
        title:"${behavior}"
        layout:{
            type:GridLayout
            column:2
        }
    
        CheckBox{
            name:no_task_record
            text:"${no_task_record}"
        }
        CheckBox{
            name:cache
            text:"${cache}"
            value:true
        }
    }
    <==>
}

#page_nfs_http
{
    text:"${HTTP}"
    layout:VBoxLayout
    visible:false
}

#page_nfs_webdav
{
    text:"${WebDAV}"
    layout:VBoxLayout
    visible:false
}

Tab#nfs
{
    visible:false

    ${#page_nfs}
    ${#page_nfs_http}
    ${#page_nfs_webdav}
}
 
