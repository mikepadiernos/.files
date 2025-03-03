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
    title:"${speed_limit_download}"
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
        "${downloads}:" Slider.slider#http_download_slider
        {
            change:$value{#http_download_spin}(...)
        }
        SpinBox.spinbox#http_download_spin
        {
            name:speed_limit_http_download
            change:$value{#http_download_slider}(...)
        }
    }
    GroupBox#speed_ftp
    {
        title:"FTP(S)"
        layout:{
            type:GridLayout
            column:4
        }
        
        "${downloads}:" Slider.slider#ftp_download_slider
        {
            change:$value{#ftp_download_spin}(...)
        }
        SpinBox.spinbox#ftp_download_spin
        {
            name:speed_limit_ftp_download
            change:$value{#ftp_download_slider}(...)
        }
    }
    GroupBox#speed_ssh
    {
        title:"${SSH}"
        layout:{
            type:GridLayout
            column:4
        }
        "${downloads}:" Slider.slider#ssh_download_slider
        {
            change:$value{#ssh_download_spin}(...)
        }
        SpinBox.spinbox#ssh_download_spin
        {
            name:speed_limit_ssh_download
            change:$value{#ssh_download_slider}(...)
        }
    }
    GroupBox#speed_torrent
    {
        title:"${torrent}"
        layout:{
            type:GridLayout
            column:4
        }
        "${downloads}:" Slider.slider#torrent_download_slider
        {
            change:$value{#torrent_download_spin}(...)
        }
        SpinBox.spinbox#torrent_download_spin
        {
            name:speed_limit_torrent_download
            change:$value{#torrent_download_slider}(...)
        }
    }
    GroupBox#speed_ed2k
    {
        title:"${ed2k}"
        layout:{
            type:GridLayout
            column:4
        }
        "${downloads}:" Slider.slider#ed2k_download_slider
        {
            change:$value{#ed2k_download_spin}(...)
        }
        SpinBox.spinbox#ed2k_download_spin
        {
            name:speed_limit_ed2k_download
            change:$value{#ed2k_download_slider}(...)
        }
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
