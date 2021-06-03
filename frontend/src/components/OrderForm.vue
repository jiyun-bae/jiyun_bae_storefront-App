<template>
  <form
    name="orderform"
    id="orderform"
    method="post"
    class="orderform"
    action="/Page"
    onsubmit="return false;"
  >
    <input type="hidden" name="cmd" value="order" />
    <div class="basketdiv" id="basket">
      <div class="row head">
        <div class="subdiv">
          <div class="check">Check</div>
          <div class="img">Image</div>
          <div class="pname">Product Name</div>
        </div>
        <div class="subdiv">
          <div class="basketprice">Price</div>
          <div class="num">Quantity</div>
          <div class="sum">Sum</div>
        </div>
        <div class="subdiv">
          <div class="basketcmd">Delete</div>
        </div>
        <div class="split"></div>
      </div>
      <div class="row data" v-for="item in products" :key="item.products_id">
        <div class="subdiv">
          <div class="check">
            <input type="checkbox" name="buy" :value="item.products_id" checked v-model="checkedNames"/>
          </div>
          <div class="img">
            <img
              :src="'//localhost:3000/api/assets/'+item.products_avatar"
              width="60"
              style="background-color: green"
            />
          </div>
          <div class="pname">
            <span>{{item.products_name}}</span>
          </div>
        </div>
        <div class="subdiv">
          <div class="basketprice">
            <input type="hidden" name="p_price" id="p_price1" class="p_price" :value="item.products_price"/>{{item.products_price}}
          </div>
          <div class="num">
            <div class="updown">
              <input type="text" name="p_num1" id="p_num1" size="1" maxlength="4" class="p_num" :value="productsCount[item.products_id]" @keyup="changeValue($event, item.products_id)"/>
              <span @click="setProductCount($event, item.products_id, 1)">
                <i class="fas fa-arrow-alt-circle-up up"></i>
              </span>
              <span @click="setProductCount($event, item.products_id, -1)">
                <i class="fas fa-arrow-alt-circle-down down"></i>
              </span>
            </div>
          </div>
          <div class="sum">{{'$'+(+item.products_price.replace('$','') * productsCount[item.products_id])}}</div>
        </div>
        <div class="subdiv">
          <div class="basketcmd">
            <a href="javascript:void(0)" class="abutton" @click="removeProduct(item)">Delete</a>
          </div>
        </div>
      </div>
    </div>

    <div class="right-align basketrowcmd">
      <a href="javascript:void(0)" class="abutton" @click="selectRemove()">Delete Selected Products</a>
      <a class="abutton" @click="removeCart()">Empty Cart</a>
    </div>

    <div class="bigtext right-align sumcount" id="sum_p_num">Product Count: {{allCount}}</div>
    <div class="bigtext right-align box blue summoney" id="sum_p_price">
      Total Price: {{'$'+allPrice}}
    </div>

    <div id="goorder" class="">
      <div class="clear"></div>
      <div class="buttongroup center-align cmd">
        <a href="#/" @click="order()">Order Selected Products</a>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  name: 'OrderForm',
  data () {
    return {
      cart: [],
      products: [],
      checkedNames: [],
      productsCount: [],
      allCount: 0,
      allPrice: 0
    }
  },
  mounted () {
    this.cart = localStorage.getItem('ShoppingCart')
    this.searchProducts()
  },
  methods: {
    removeCart: function () {
      localStorage.setItem('ShoppingCart', null)
      localStorage.setItem('productsCount', null)
      this.products = []
      this.checkedNames = []
      this.productsCount = []
      this.allCount = 0
      this.allPrice = 0
    },
    searchProducts: function () {
      // using JSONPlaceholder
      const baseURI = `//localhost:3000/api/products/${this.cart}`
      this.$http.get(`${baseURI}`).then((result) => {
        this.products = result.data
        // this.posts = result.data
        result.data.forEach(el => {
          this.checkedNames.push(el.products_id)
          this.productsCount[el.products_id] = 1
        })
        if (JSON.parse(localStorage.getItem('productsCount'))) {
          this.productsCount = JSON.parse(localStorage.getItem('productsCount'))
        }
        this.productsCount.forEach(e => {
          this.allCount += e
        })
        this.setAllPrice()
      })
    },
    selectRemove: function () {
      this.products.forEach(item => {
        if (this.checkedNames.includes(item.products_id)) {
          setTimeout(() => {
            this.removeProduct(item)
          }, 0)
        }
      })
    },
    removeProduct: function (item) {
      this.products.splice(this.products.findIndex(e => e.products_id === item.products_id), 1)
      this.cart = JSON.parse(localStorage.getItem('ShoppingCart'))
      this.cart.splice(this.cart.findIndex(e => e === item.products_id), 1)
      if (this.cart.length === 0) {
        localStorage.setItem('ShoppingCart', null)
        localStorage.setItem('productsCount', null)
      } else {
        localStorage.setItem('ShoppingCart', JSON.stringify(this.cart))
        localStorage.setItem('productsCount', JSON.stringify(this.productsCount))
      }
      if (this.checkedNames.includes(item.products_id)) {
        this.checkedNames.splice(this.checkedNames.findIndex(e => e === item.products_id), 1)
      }
      delete this.productsCount[item.products_id]
      this.allCount -= 1
      this.setAllPrice()
    },
    setProductCount: function ($event, idx, el) {
      this.productsCount[idx] += el
      $event.target.parentNode.parentNode.querySelector('input').value = this.productsCount[idx]
      $event.target.parentNode.parentNode.parentNode.parentNode.querySelector('.sum').innerText = '$' + (this.products[this.products.findIndex(e => e.products_id === idx)].products_price.replace('$', '') * this.productsCount[idx])
      this.allCount += el
      this.setAllPrice()
      localStorage.setItem('productsCount', JSON.stringify(this.productsCount))
    },
    changeValue ($event, idx) {
      this.productsCount[+$event.target.attributes._id.value] = +$event.target.value
      $event.target.parentNode.parentNode.parentNode.querySelector('.sum').innerText = '$' + (this.products[this.products.findIndex(e => e.products_id === +$event.target.attributes._id.value)].products_price.replace('$', '') * this.productsCount[+$event.target.attributes._id.value])
      localStorage.setItem('productsCount', JSON.stringify(this.productsCount))
    },
    setAllPrice () {
      let price = 0
      this.products.forEach(e => {
        price += ((+e.products_price.replace('$', '')) * this.productsCount[e.products_id])
      })
      this.allPrice = price
    },
    order () {
      this.removeCart()
    }
  }
}
</script>
