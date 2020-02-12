     function something()
     {
		
		
     	
     };

     function add_to_cart(id){
         var x = window.localStorage.getItem('cart');
          x = x * 1 + 1;
          
          window.localStorage.setItem('cart',x);
     
               alert('You added pizza with id:'+id);
     }