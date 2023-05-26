<template>
  <div>{{ htmlString }}</div>
  <div v-html="htmlString"></div>
</template>

<script>
export default {
  data() {
    return {
      htmlString: '<p style="color:red">빨간색 문자</p>'
    }
  }
}
</script>
