#page_torrent_task
{
    text:"${task}"
    layout:VBoxLayout
    
    GroupBox
    {
        title:"${options}"
        
        layout:{
            type:GridLayout
            column:4
        }
        
        "${speed_limit_download}:" SpinBox{
            name:speed_limit_download
            max:9999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
        
        "${speed_limit_upload}:" SpinBox{
            name:speed_limit_upload
            max:9999999
            suffix:KB
            step:100
            special-text:"${unlimited}"
        }
        "${max_connections}:" SpinBox{
            min:1
            max:99999
            name:max_connections
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
                max:9999999
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
            "${action}:" ComboBox
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
                step:100
                special-text:"${unlimited}"
            }
            <==>
        }
    }
    GroupBox
    {
        title:"${behavior}"
        layout:{
            type:GridLayout
            column:3
        }
        
        CheckBox{
            name:auto_rename_file
            text:"${auto_rename_file}"
            value:true
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
            value:false
        }
    }

    <==>
} 

Tab#torrent
{
    visible:false
    ${#page_torrent_task}
}
