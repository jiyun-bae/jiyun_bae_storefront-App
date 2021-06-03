<template>
  <div>
    <div>
      <img src="//localhost:3000/api/assets/rip_main.png" alt="mainProuct" />
    </div>
    <h2>{{id}}</h2>
    <div class="products-container">
      <div class="products" v-for="(item) in products" :key="item.products_id">
        <img
          :src="'//localhost:3000/api/assets/'+item.products_avatar"
          :alt="item.products_name"
          style="background-color: white"
          width="400px"
        />
        <h4>{{item.products_name}}</h4>
        <p>{{item.products_price}}</p>
        <button class="btn btn-primary shop-item-button" v-on:click="addCart(item.products_id, item.products_name)" type="button">
          ADD TO CART
        </button>
      </div>
    </div>
    <div class="modal" v-show="modal_show">
      <div class="modal_head">
        <span class="cancel"><a @click="modalCancel()">✖︎</a></span>
      </div>
      <div class="modal_body">
        <div class="valign">
          <div class="middle">
            <p v-if="isClick">This product is already packed</p>
            <p v-else>[<span>{{selectProduct}}</span>] The product has been added to the cart. <br />Go to the shopping cart page?</p>
            <div v-if="!isClick" class="btn-area">
              <a href="#/soppingcart" @click="modalCancel()" class="btn yes">Yes</a>
              <a class="btn no" @click="modalCancel()">No</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { Fragment } from 'vue-fragment'
export default {
  props: ['id'],
  components: { Fragment },
  name: 'Products',
  data () {
    return {
      products: [],
      modal_show: false,
      isClick: true,
      cart: [],
      selectProduct: ''
    }
  },
  created () {
    this.searchProducts()
  },
  methods: {
    searchProducts: function () {
      // using JSONPlaceholder
      const baseURI = `//localhost:3000/api/products/${this.id.toLowerCase()}`
      this.$http.get(`${baseURI}`).then((result) => {
        this.products = result.data
      })
    },
    addCart: function (e, name) {
      document.querySelector('body').style.overflow = 'hidden'
      this.isClick = false
      if (JSON.parse(localStorage.getItem('ShoppingCart'))) {
        this.cart = JSON.parse(localStorage.getItem('ShoppingCart'))
        this.cart.forEach(el => {
          if (el === e) {
            this.isClick = true
          }
        })
        if (!this.isClick) {
          this.cart.push(e)
          localStorage.setItem('ShoppingCart', JSON.stringify(this.cart))
        }
      } else {
        this.cart.push(e)
        localStorage.setItem('ShoppingCart', JSON.stringify(this.cart))
      }
      this.selectProduct = name
      this.modal_show = true
    },
    modalCancel: function () {
      document.querySelector('body').style.overflow = ''
      this.modal_show = false
    }
  },
  watch: {
    id: function (newVal, oldVal) {
      this.searchProducts()
    }
    // $route (to, from) {
    //   if (to.path !== from.path) {
    //     /* router path가 변경될 때마다 서버로 접근로그를 저장한다. */
    //     this.searchProducts()
    //   }
    // }
  }
}
</script>

<style scoped>
.valign{display:table; width:100%; height:100%;}
.valign .middle{display:table-cell; vertical-align:middle}
.modal{position:fixed; min-width:320px; min-height:230px; width:35%; height:30%; background-color:rgb(239, 215, 225); border-radius:1em; top:50%; left:50%; transform:translate(-50%, -50%); box-shadow: 0px 0px 10px 2px rgba(239, 215, 225, .3);}
.modal_head{padding:0.5em; background-color:#c9707f; border-radius:1em 1em 0 0; height:15%; box-sizing: border-box;}
.modal_head span.cancel{width:20px; height:20px; background-color:#FF6057; display:block; border-radius:100%; position:relative;}
.modal_head a{display:block; position:absolute; top:0; left:0; width:100%; height:100%; cursor:pointer;}
.modal_body{padding:0.5em; height:85%; box-sizing:border-box;}
.modal_body span{font-weight:bold; color:#FF6057;}
.modal_body .btn-area{padding-top:1em;}
.modal_body .btn-area a.btn{cursor:pointer; border-radius:0.5em; display:inline-block; width:15%; padding:1% 0; position:relative; font-weight:bold;}
.modal_body .btn-area a.btn.no{background-color:red;}
.modal_body .btn-area a.btn.yes{background-color:yellowgreen;}

</style>
