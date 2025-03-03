EditDialog#main
{
    title-add:"${add_catalog}"
    title-edit:"${edit}"
    layout:VBoxLayout
    width:500
    height:315
    form:${#main}
    buttons:default
    
    GridLayout
    {
        column:2
        
        "${name}: " LineEdit{
            name:name
            placeholder:"${catalog_name_placeholder_}"
        }
        "${path}: " PathEdit{
            name:path
            mode:dir
            placeholder:"${catalog_save_path_placeholder_}"
        }
    }
    GroupBox
    {
        title:"${auto_set_catalog}"
        layout:VBoxLayout
        
        
        HBoxLayout
        {
            CheckBox{
                name:matches_creation_time
                text:"${matches_creation_time}:"
                value:false
                
                toggle:{
                    $enable{#creation_time_begin}(...)
                    $enable{#creation_time_end}(...)
                }
            }
            <==>
            /*
            "${preseted}:" ComboBox#creation_time_preset
            {
                vtype:data
                value:0
                change:$value{#matches_creation_time}($value{#creation_time_preset}())
                {
                    text:"${none}"
                    data:""
                }
                {
                    text:"1 ${day}"
                }
                {
                    text:"1 ${week}"
                }
                {
                    text:"1 ${month}"
                }
            }
            */
        }
        HBoxLayout
        {
             margin:0
            
            "${begin}:" DateTimeEdit#creation_time_begin{
                enable:false
                name:creation_time_begin
                value:now
            }
            <==>
            "${end}:" DateTimeEdit#creation_time_end{
                enable:false
                name:creation_time_end
                value:tomorrow
            }
        }
        
        HBoxLayout
        {
             CheckBox{
                name:matches_file_extension
                text:"${matches_file_extension}"
             
                toggle:$enable{#extensions}(...)
            }
            <==>
            "${preseted}:" ComboBox#extensions_preset
            {
                vtype:data
                value:0
                size-adjust:content
                stretch:expand
                change:$value{#extensions}($value{#extensions_preset}())
                {
                    text:"${none}"
                    data:""
                }
                {
                    text:"${video}"
                    data:"mkv,msp,m3u8,swf,3gpp,3gp,avi,f4f,f4m,flv,ogg,mp4,mpeg,mov,webm,mpg4,asf,wmv,rmvb,rm"
                }
                {
                    text:"${audio}"
                    data:"mp3,m4a,wav,wma,aac,cda"
                }
                {
                    text:"${archive}"
                    data:"0,000,001,7z,ace,ain,alz,apz,ar,arc,cad,cab,gz,tar,zip,rar,tar,pax,cpio,xar,lha,mtree,iso,xz,lzip,lzma,bzip2,uue,jar,z,lzh,xpi"
                }
                {
                    text:"${document}"
                    data:"chm,doc,docx,docm,dotx,dotm,xls,xlsx,xlsm,xltx,xltm,xlam,ppt,pptx,pptm,potm,ppam,ppsx,ppsm,odt,pdf,odp,ods,tsv,wps,md,txt"
                }
                {
                    text:"${torrent}"
                    data:"torrent"
                }
            }
        }
        TextEdit#extensions{
            name:file_extensions
            enable:false
        }
      
        <==>
    }
}
