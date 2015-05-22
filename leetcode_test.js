/**
 * @param {number} n
 * @return {boolean}
 */
var repeat = new Object();
var isHappy = function(n) {

  if(n == null){
    return false;
  }else if(n.toString().length <= 0){
    return false;
  }

  var size = n.toString().length;
  
  var sum = 0;
  var i;
  for(i = size; i; i--){
    sum = sum + Math.pow((n % Math.pow(10, i) - n % Math.pow(10, i - 1))/Math.pow(10, i - 1), 2);
  }

  if(sum == 1){
    return true;
  }else if(repeat[sum]){
    return false;
  }else{
    return isHappy(sum);
  }
};


a = 17;
console.log(isHappy(a));
