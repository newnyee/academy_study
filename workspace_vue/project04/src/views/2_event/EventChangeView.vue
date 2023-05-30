<template>
  <div>
    <h3>change 이벤트</h3>
    <select name="" id="" @change="changeCity" v-model="selectedCity">
      <option value="">==도시선택==</option>
      <option v-for="city in cityList" :key="city.cityCode" :value="city.cityCode">{{ city.title }}</option>
    </select>
    <select name="" id="">
      <option value="">==동선택==</option>
      <option v-for="dong in selectedDongList" :key="dong.dongCode" :value="dong.dongCode">{{ dong.dongTitle }}</option>
    </select>
  </div>
  <hr>

  <!-- 양방향이기 때문에 change이벤트를 사용하지 않고도 구현 가능 (단, 가독성이 떨어지므로 비추천) -->
  <div>
    <select name="" id="" v-model="selectedCity1">
      <option value="">==도시선택==</option>
      <option v-for="city in cityList" :key="city.cityCode" :value="city.cityCode">{{ city.title }}</option>
    </select>
    <select name="" id="">
      <option value="">==동선택==</option>
      <option v-for="dong in dongList.filter(dong => dong.cityCode === selectedCity1)" :key="dong.dongCode" :value="dong.dongCode">{{ dong.dongTitle }}</option>
    </select>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cityList: [
        { cityCode: '02', title: '서울' },
        { cityCode: '051', title: '부산' },
        { cityCode: '064', title: '제주' }
      ],
      dongList: [
        { cityCode: '02', dongCode: '1', dongTitle: '서울 1동' },
        { cityCode: '02', dongCode: '2', dongTitle: '서울 2동' },
        { cityCode: '02', dongCode: '3', dongTitle: '서울 3동' },
        { cityCode: '02', dongCode: '4', dongTitle: '서울 4동' },
        { cityCode: '051', dongCode: '1', dongTitle: '부산 1동' },
        { cityCode: '051', dongCode: '2', dongTitle: '부산 2동' },
        { cityCode: '051', dongCode: '3', dongTitle: '부산 3동' },
        { cityCode: '064', dongCode: '1', dongTitle: '제주 1동' },
        { cityCode: '064', dongCode: '2', dongTitle: '제주 2동' }
      ],
      selectedCity: '', // cityCode 저장
      selectedDongList: [], // selectedCity 코드로 filter된 dongList 저장
      selectedCity1: ''
    }
  },
  methods: {
    changeCity() { // select된 cityCode(selectedCity)를 이용하여 selectedDongList 저장
      this.selectedDongList = this.dongList.filter(dong => dong.cityCode === this.selectedCity)
    }
  }
}
</script>
