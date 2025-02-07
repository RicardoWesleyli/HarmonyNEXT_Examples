// 变量声明
let userName = "Ricardo"

// 常量声明
const pi = 3.14159


let isTap: boolean = false

function toggleIsTap() {
  isTap = !isTap
}

let sum: number = 0

// function addNumbers(num1: number, num2: number): number {
//   return  num1 + num2
// }

let addNumbers = (num1: number, num2: number): number => num1 + num2;

function checkScore(score: number) {
  if (score < 60) {
    console.log('不合格')
  } else if (score >= 60 && score < 90) {
    console.log('合格')
  } else if (score >= 90) {
    console.log('优秀')
  }
}

function checkGrade(grade: string) {
  switch (grade) {
    case 'A':
      console.log('优秀');
      break;
    case 'B':
      console.log('良好');
      break;
    case 'C':
      console.log('合格');
      break;
    case 'D':
      console.log('不合格');
      break;
    default:
      console.log('无效的成绩');
  }
}

checkGrade('A');  // 输出：优秀
checkGrade('B');  // 输出：良好
checkGrade('C');  // 输出：合格
checkGrade('D');  // 输出：不合格
checkGrade('F');  // 输出：无效的成绩

const scores = [85, 92, 78, 64, 89];

for (let score of scores) {
  console.log('成绩:', score);
}

// 父类
class Animal {
  name = ''

  eat() {
    console.log(`${this.name}正在吃东西`)
  }
}

// 子类
class Cat extends Animal {
  hobby() {
    console.log(`${this.name} 喜欢抓猫抓板`);
  }
}

function showCatDetail(){
  let animal = new Animal()
  let cat = new Cat()
  cat.name = 'Tom'
  cat.eat()
  cat.hobby()
}