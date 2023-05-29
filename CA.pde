class CA{
    
  public CA(int[] ruleset){
    ruleset_ = ruleset;
  }
  
  int next(int left, int center, int right){
   if(left == 0 && center == 0 && right == 0)
     return ruleset_[0];
   else if(left == 0 && center == 0 && right == 1)
     return ruleset_[1];
   else if(left == 0 && center == 1 && right == 0)
     return ruleset_[2];
   else if(left == 0 && center == 1 && right == 1)
     return ruleset_[3];
   else if(left == 1 && center == 0 && right == 0)
     return ruleset_[4];
   else if(left == 1 && center == 0 && right == 1)
     return ruleset_[5];
   else if(left == 1 && center == 1 && right == 0)
     return ruleset_[6];
   else if(left == 1 && center == 1 && right == 1)
     return ruleset_[7];  
   return 0;
  }
  
  public int[] nextGeneration(int[] generation){
    // do the ruleset
    int[] buffer = new int[generation.length];
    for(int i = 1; i < generation.length - 1; i++){
      int left = generation[i - 1];
      int center = generation[i];
      int right = generation[i + 1];
      
      buffer[i] = next(left, center, right);
    }
    return buffer;
  }
    
  public int[] ruleset_;
}
