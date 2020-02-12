     function something()
     {
		
		
     	
     };

     function add_to_cart(id){
         var key = 'product_'+id;
         var x = window.localStorage.getItem(key);
         x = x *1 +1;
          
          window.localStorage.setItem(key,x);
     
               alert('You added pizza with id: '+ x );
     }
     function buy(){
         window.localStorage.clear();
         
     }