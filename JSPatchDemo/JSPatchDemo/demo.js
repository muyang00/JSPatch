defineClass('MainViewController:UITableViewController', {
    log:function(){
        console.log('js log output');
    },
          
    //require protocol  
    tableView_numberOfRowsInSection: function(tableView, section){
         return 5;  
    },
            
    tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
    	var cell = tableView.dequeueReusableCellWithIdentifier("cell") 
    	if (!cell) {
      		cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(3, "cell")
    	}
        cell.textLabel().setTextColor(require('UIColor').redColor());
    	cell.textLabel().setText("hello"+indexPath.row())
    	return cell
  	},
 
    //optional protocol
    //这个方法在MainViewController原生实现中没有重写，这种情况下，无法调用forwardInvocatin
    tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
    	return 80;
  	},


})

