<template>
  <div>
    <h2>배열 데이터 바인딩</h2>
    <hr>

    <h3>목록</h3>
    <select name="" id="">
      <option value=""></option>
      <option v-for="city in cities" :value="city.code" :key="city.code">{{ city.title }}</option>
    </select> <!-- 반복문이 오면 유일한 값으로 :key 반드시 추가해야함 -->
    <hr>

    <h3>표 작성 후 목록 출력</h3>
    <table>
      <thead>
        <tr>
          <th>제품번호</th>
          <th>제품명</th>
          <th>제품가격</th>
          <th>주문수량</th>
          <th>합계</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="drink in drinkList" :key="drink.drinkId"> <!-- :key == primary key -->
          <td>{{ drink.drinkId }}</td>
          <td>{{ drink.drinkName }}</td>
          <td>{{ drink.price }}</td>
          <td>
            <select name="" id="" v-model="drink.qty">
              <option value=0>0</option>
              <option v-for="m in 5" :key=m :value=m>{{ m }}</option>
            </select>
          </td>
          <td>{{ drink.price * drink.qty }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cities: [
        { title: '서울', code: '02' },
        { title: '부산', code: '051' },
        { title: '제주', code: '064' }
      ],
      drinkList: [
        { drinkId: '1', drinkName: '코카콜라', price: 700, qty: 0 },
        { drinkId: '2', drinkName: '오렌지주스', price: 1200, qty: 0 },
        { drinkId: '3', drinkName: '커피', price: 500, qty: 0 },
        { drinkId: '4', drinkName: '물', price: 700, qty: 0 },
        { drinkId: '5', drinkName: '보리차', price: 1200, qty: 0 },
        { drinkId: '6', drinkName: '포카리', price: 1000, qty: 0 },
        { drinkId: '7', drinkName: '뽀로로', price: 1300, qty: 0 }
      ]
    }
  }
}
</script>
