<template>
  <div>
    <h3>click 이벤트</h3>
    <button @click="increaseCounter">좋아요</button>
    <p>{{ counter }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      counter: 0
    }
  },
  methods: {
    increaseCounter() {
      this.counter++
    }
  }
}
</script>
