/*myscript.js*/

// 두수사이의 합을 반환하시오
const hap = (a, b) => {
  if (a>b) {
    let tmp=a; a=b; b=tmp    
  }

  let sum = 0
  for(let n=a; n<b; n++) {
    sum += n
  }

  return sum
}

// 두수사이의 차이를 반환하시오 (절대값)
const diff = (a, b) => {
  return Math.abs(a-b)
}

// 윤년, 평년을 반환하시오
const leap = (year) => {
  if(year%4===0 && year%100!==0 || year%400===0) {
    return true
  } else {
    return false
  }
}