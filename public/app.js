     function something()
     {
		
		
     	
     };

     function add_to_cart(id){
         var key = 'product_'+id;
         var x = window.localStorage.getItem(key);
         x = x *1 +1;
          
          window.localStorage.setItem(key,x);
     
               // alert('You added pizza with id: '+ x );
               total_order_count();
     }
     function buy(){
         window.localStorage.clear();
         
     }

     function total_order_count(){
         total =0;
         for(var i=0;i<localStorage.length; i++)
         {
          var key = window.localStorage.key(i); // get key from hash Localstorage
          var value = window.localStorage.getItem(key);
          if (key.indexOf('product_') == 0)
               {
                   
                    total +=value *1;
               }
         }
       var total_out = document.getElementById('total_order_count');
       total_out.value = 'В корзине : '+total+' пицц'; 
     }