defineClass('MainViewController:UITableViewController', {
    log:function(){
        console.log('js log output');
    },
            
    //这个方法在MainViewController原生实现中没有重写，这种情况下，无法调用forwardInvocatin
    tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
    	return 300;
  	},    
})

