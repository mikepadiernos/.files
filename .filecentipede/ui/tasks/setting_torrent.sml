
VBoxLayout#torrent
{
    ComboBox#torrent_uri{
        size-adjust:minimum
    }
    
    GridLayout
    {
        column:8

        "${max_connections}:" ComboBox{
            name:max_connections
            vtype:number
            editable:true
            1 2 4 8 16 32 64 128 256 512 1024 2048
        }
        
        "${speed_limit_upload}:" SpinBox{
            name:speed_limit_upload
            max:9999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
        
        "${speed_limit_download}:" SpinBox{
            name:speed_limit_download
            max:9999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
    }
    
    GridLayout
    {
        column:2
        
        "${file_name}:" HBoxLayout
        {
            LineEdit{
                name:file_name
            }
            
            "${catalog}:" ComboBox#torrent_catalog{
                name:catalog
                vtype:data
                editable:false
                {text:"  ---  ",data:""}
            }
        }
        
        "${save_path}:" HBoxLayout
        {
            ComboBox#torrent_save_path
            {
                name:save_path
                editable:true
                vtype:text
                stretch:expand
                placeholder:"${save_path_placeholder}"
                items:$filec-paths()
            }
            Button{
                text:"..."
                click:$select-dir("${save_path}",${#torrent_save_path})
            }
        }
    }
    GroupBox
    {
        layout:VBoxLayout
        title:"${seeding_limit}"
        
        GridLayout
        {
            column:4
            
            CheckBox
            {
                name:seeding_limit_ratio_enable
                text:"${ratio_reached}"
                toggle:$enable{#seeding_limit_ratio}(...)
            }
            DoubleSpinBox#seeding_limit_ratio
            {
                name:seeding_limit_ratio
                enable:false
                min:0.5
                max:2147483647
                step:0.1
                decimals:2
                value:1
            }
            
            CheckBox
            {
                name:seeding_limit_minutes_enable
                text:"${duration_reached}"
                toggle:$enable{#seeding_limit_minutes}(...)
            }
            SpinBox#seeding_limit_minutes
            {
                name:seeding_limit_minutes
                enable:false
                min:1
                max:2147483647
                suffix:"${minutes}"
            }
            
            CheckBox
            {
                name:seeding_limit_size_enable
                text:"${size_reached}"
                toggle:$enable{#seeding_limit_size}(...)
            }
            SpinBox#seeding_limit_size
            {
                name:seeding_limit_size
                enable:false
                min:1
                max:2147483647
                suffix:MB
            }
        }
        HBoxLayout
        {
            "${action}:"
            ComboBox
            {
                name:seeding_limit_act
                vtype:index
                "${none}"
                "${stop}"
                "${speed_limit}"
                "${delete_task}"
                "${delete_task_and_file}"
            }
                     
            SpinBox{
                name:seeding_limit_speed_limit
                min:0
                max:2147483647
                suffix: KB
                special-text:"${unlimited}"
            }
            <==>
        }
    }
    GridLayout
    {
        column:3
        
        CheckBox{
            name:auto_rename_file
            text:"${auto_rename_file}"
        }
        CheckBox
        {
            name:without_confirm
            text:"${without_confirm}"
            value:false
        }
        CheckBox{
            name:sequential
            text:"${sequential_download}"
        }
        
    }
    <==>
} 
