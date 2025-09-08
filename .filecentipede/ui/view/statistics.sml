.value
{
    css:"font-weight:bold"
}

Dialog#main
{
    title:"${statistics}"
    icon:"icons/16/statistics.svg"
    layout:{
        type:GridLayout
    }
    
    GroupBox
    {
        title:"${total}"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${total_downloaded_bytes}" LineView.value{
            name:total_downloaded_bytes
            format:bytes
            value:0
        }
        "${total_uploaded_bytes}:" LineView.value{
            name:total_uploaded_bytes
            format:bytes
            value:0
        }
        "${total_downloaded_tasks}:" LineView.value{
            name:total_downloaded_tasks
            value:0
        }
        "${total_share_ratio}:" LineView.value{
            name:total_share_ratio
            value:0
        }
    }
    
    GroupBox
    {
        title:"HTTP"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${total_downloaded_bytes}: " LineView.value{
            name:total_http_downloaded_bytes
            value:0
            format:bytes
        }
        "${total_uploaded_bytes}: " LineView.value{
            name:total_http_uploaded_bytes
            value:0
            format:bytes
        }
        "${total_downloaded_tasks}: " LineView.value{
            name:total_http_downloaded_tasks
            value:0
        }
        "${total_uploaded_tasks}: " LineView.value{
            name:total_http_uploaded_tasks
            value:0
        }
    }
    GroupBox
    {
        title:"FTP"
        layout:{
            type:GridLayout
            column:4
        }
        
            
        "${total_downloaded_bytes}: " LineView.value{
            name:total_ftp_downloaded_bytes
            value:0
            format:bytes
        }
        "${total_uploaded_bytes}: " LineView.value{
            name:total_ftp_uploaded_bytes
            value:0
            format:bytes
        }
        "${total_downloaded_tasks}: " LineView.value{
            name:total_ftp_downloaded_tasks
            value:0
        }
        "${total_uploaded_tasks}: " LineView.value{
            name:total_ftp_uploaded_tasks
            value:0
        }
    }
    GroupBox
    {
        title:"SSH"
        layout:{
            type:GridLayout
            column:4
        }
  
        "${total_downloaded_bytes}: " LineView.value{
            name:total_ssh_downloaded_bytes
            value:0
            format:bytes
        }
        "${total_uploaded_bytes}: " LineView.value{
            name:total_ssh_uploaded_bytes
            value:0
            format:bytes
        }
        "${total_downloaded_tasks}: " LineView.value{
            name:total_ssh_downloaded_tasks
            value:0
        }
        "${total_uploaded_tasks}: " LineView.value{
            name:total_ssh_uploaded_tasks
            value:0
        }
    }
    GroupBox
    {
        title:"${torrent}"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${total_downloaded_bytes}: " LineView.value{
            name:total_torrent_downloaded_bytes
            value:0
            format:bytes
        }
        "${total_uploaded_bytes}: " LineView.value{
            name:total_torrent_uploaded_bytes
            value:0
            format:bytes
        }
        "${total_downloaded_tasks}: " LineView.value{
            name:total_torrent_downloaded_tasks
            value:0
        }
    }
    GroupBox
    {
        title:"${ed2k}"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${total_downloaded_bytes}: " LineView.value{
            name:total_ed2k_downloaded_bytes
            value:0
            format:bytes
        }
        "${total_uploaded_bytes}: " LineView.value{
            name:total_ed2k_uploaded_bytes
            value:0
            format:bytes
        }
        "${total_downloaded_tasks}: " LineView.value{
            name:total_ed2k_downloaded_tasks
            value:0
        }
    }
    GroupBox
    {
        title:"${Stream}"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${total_downloaded_bytes}: " LineView.value{
            name:total_stream_downloaded_bytes
            value:0
            format:bytes
        }
        "${total_downloaded_tasks}: " LineView.value{
            name:total_stream_downloaded_tasks
            value:0
        }
    }

}
 
$filec-on({
    statistics: $filec-form{#main}(...)
})
