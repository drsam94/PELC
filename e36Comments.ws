GotoStart[Space][Tab]
 
 	
Begin_Exp[b][e]--[Tab][Space][Tab]
  	 	
store_b_at_heap_loc_2:push2:   	 
pushb[stack2] 	  	 
store:		 MakeB=1:swap 
	pop 

push1   	
swap 
	startLoop[Space][Tab][Space]
   	 
Ife=0retB:dup 
 if0jumpToZERO
	      
else:B=B*b:swap 
	push_b:push2:   	 
get:			mul	  
:swap 
	dec_e:push1   	
sub	  	goBackToLoop
 
 	 
ZERO[Space][Space][Space][Space][Space]
       
pop 

end_sub
	
Begin_Order_Of_Magnitude[Tab][Tab]
  		
store0_at_heap_loc_5   	 	
    pre:b_at_heap_loc_1
		 pushb:push1   	
get			startRecurse[Tab][Tab][Tab]
  			
dup 
 push1   	
sub	  	push_input_back_on[copy2] 	  	 
sub	  	jump_later_ifb^n<input
			 
else:cleanup:_swap 
	pop 

pop 

push5   	 	
getHeap[5]			end_sub
	
Later[Tab][Space]
  	 
pushb:push1   	
get			mul	  
push5   	 	
dup 
 getHeap[5]			push1   	
add	   store_in_heap[5]		 repeatloop
 
			
Begin_Is_Palindrome[b][x][Space][Space][Space]
     
store_b_inHeap[1]swap 
	push1   	
swap 
	store		 dup 
 call_oam
 			
store_oam_inHeap[4]:push4   	  
swap 
	store		 StartLoop[sst]
    	
dupx 
 store_x_inHeap[3]:push3   		
swap 
	store		 If_oam_<1:returnTrue(0)push_oam:push4   	  
get			push1   	
sub	  	IfNeg,GoToEndTrue[tstst]
			 	 	
push_last_digit:pushb:push1   	
get			mod	 		push_first_digit:pushx:push3   		
get			pushb^oam:pushb:push1   	
get			push_oam:push4   	  
get			call_exp[tst]
 		 	
div	 	 Equal?[sub;0ifEqual]	  	If0gotoNextTest[ttss]
	 		  
elsegotoEndFalse[ttttt]
 
					
NextTest[Tab][Tab][Space][Space]
  		  
else:cutoff_ends&go_again:push_x:push3   		
get			pushb^oam:pushb:push1   	
get			push_oam:push4   	  
get			call_exp[tst]
 		 	
mod	 		divb:pushb:push1   	
get			div	 	 explicitlydecoambc0spush_oam:push4   	  
dup 
 get			push2   	 
sub	  	store		 gotoTopOfMethod
 
  	
EndTrue[Tab][Space][Tab][Space][Tab]
  	 	 	
pop 

push0:    
end_sub
	
EndFalse[Tab][Tab][Tab][Tab][Tab]
  					
push-1:  		
end_sub
	
"Start"[Space][Tab]
   	
StoreSum(0)AtHeap[0]:push0    
dup 
 store		 push1   	
BeginMainLoop[Tab][Tab][Tab][Space][Space]
  			  
dup 
 IfNotDecPalindromeGotoEnd[ssttt]:push10   	 	 
swap 
	call_isPalindrome
 	   
ifNegGotoEnd:
		  			
else:dup 
 IfNotBinPalindromeGotoEnd[ssttt]push2   	 
swap 
	call_isPalindrome
 	   
ifNegGotoEnd
		  			
else:dup 
 AddToSum:push0    
get			add	   push0    
swap 
	store		 End[Space][Space][Tab][Tab][Tab]
    			
inc:push1   	
add	   dup 
 If<1e6gototop:push1e6   				 	    	  	      
sub	  	:ifNegtoTop
					  
else:pop 

OutputSum:push0    
get			print	
 	pushLF   	 	 
print	
  EOF



