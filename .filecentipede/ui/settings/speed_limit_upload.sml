.slider
{
    orient:h
    min:0
    max:10000
 
}
.label
{
   
}
.spinbox
{
    min:0
    max:2147483647
    suffix:" KB/s"
    step:100
    special-text:"${unlimited}"
    max-width:100
}
.speed
{
    text:"0B/s"
    width:50
}

Dialog#main
{
    title:"${speed_limit_upload}"
    layout:VBoxLayout
    width:400
    height:350
    
    GroupBox#speed_http
    {
        title:"HTTP(S)"
        layout:{
            type:GridLayout
            column:4
        }
        "${uploads}:" Slider.slider#http_upload_slider{
            change:$value{#http_upload_spin}(...)
        }
        SpinBox.spinbox#http_upload_spin
        {
            name:speed_limit_http_upload
            change:$value{#http_upload_slider}(...)
        }
    }
    GroupBox#speed_ftp
    {
        title:"FTP(S)"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${uploads}:" Slider.slider#ftp_upload_slider{
            change:$value{#ftp_upload_spin}(...)
        }
        SpinBox.spinbox#ftp_upload_spin
        {
            name:speed_limit_ftp_upload
            change:$value{#ftp_upload_slider}(...)
        }
    }
    GroupBox#speed_ssh
    {
        title:"SSH"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${uploads}:" Slider.slider#ssh_upload_slider{
            change:$value{#ssh_upload_spin}(...)
        }
        SpinBox.spinbox#ssh_upload_spin
        {
            name:speed_limit_ssh_upload
            change:$value{#ssh_upload_slider}(...)
        }
    }
    GroupBox#speed_torrent
    {
        title:"${torrent}"
        layout:{
            type:GridLayout
            column:4
        }

        "${uploads}:" Slider.slider#torrent_upload_slider{
            change:$value{#torrent_upload_spin}(...)
        }
        SpinBox.spinbox#torrent_upload_spin
        {
            name:speed_limit_torrent_upload
            change:$value{#torrent_upload_slider}(...)
        }
    }
    GroupBox#speed_ed2k
    {
        title:"${ed2k}"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${uploads}:" Slider.slider#ed2k_upload_slider{
            change:$value{#ed2k_upload_spin}(...)
        }
        SpinBox.spinbox#ed2k_upload_spin
        {
            name:speed_limit_ed2k_upload
            change:$value{#ed2k_upload_slider}(...)
        }
    }
    Label{
        css:"color:gray"
	wordwrap:true
        text:"${speed_limit_upload_notice_}"
    }
    

    HBoxLayout
    {
        <==>
        Button#save{text:"${apply}"}
        Button{
            click:$close{#main}()
            text:"${cancel}"
        }
        
    }
    
}
