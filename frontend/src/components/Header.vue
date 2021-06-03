<template>
    <header id="mainHeader" class="row">
        <h1 class="hidden">Home Page Layout</h1>
        <nav id="mainNav" >
          <h2 class="hidden">Main Navigation</h2>
          <div id="logo">
            <a href="#/"><img src="//localhost:3000/api/assets/logo.jpeg" alt="main logo" width="100px" /></a>
          </div>
          <nav role="navigation">
            <div id="menuToggle">
              <input type="checkbox" />
                <span></span>
                <span></span>
                <span></span>
              <ul id="menu">
                  <li><a href="#/product/RIP">RIP</a></li>
                  <li><a href="#/product/SKIN">SKIN</a></li>
                  <li><a href="#/product/EYE">EYE</a></li>
              </ul>
            </div>
          </nav>
                <div id="common-menu">
                    <a href="#" v-on:click="searchTerm()" ><img src="//localhost:3000/api/assets/user-alt-solid.svg" alt="user" width="25px"></a>
                    <a href="#"><img src="//localhost:3000/api/assets/search-solid.svg" alt="search" width="25px"></a>
                    <a href="#/soppingcart"><img src="//localhost:3000/api/assets/shopping-cart-solid.svg" alt="shoppingcart" width="28px"></a>
                </div>
            </nav>
    </header>
</template>

<script>
export default {
  props: {msg: String},
  name: 'Header',
  data () {
    return {
      posts: []
    }
  },
  mounted () {
    // this.searchTerm()
  },
  methods: {
    searchTerm: function () {
      // using JSONPlaceholder
      const baseURI = '//localhost:3000/api/assets/logo.jpeg'
      this.$http.get(`${baseURI}`).then((result) => {
        console.log(result)
        // this.posts = result.data
      })
    }
  }
}
</script>
