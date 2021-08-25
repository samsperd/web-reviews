<template>
<wrapper>
<!-- <v-app id="inspire">
  <navbar></navbar>
    <v-container>
      <v-main> -->
  <div>
      <!-- <section class="card rounded h-100 success">
        <h4 class="container text-white">Find verified online businesses that delivers to your location</h4>
        <home-search :flower="'mb-0 col-md-7'" class="putmecenter" />
      </section> -->
      <section>
        <v-row
        >
            <v-img
        :height="$vuetify.breakpoint.smAndDown ? 'calc(100vh - 66px - 56px)' : 'calc(100vh - 66px - 64px)'"
        :src="sourced"
        :gradient="this.$vuetify.theme.dark ? 'to top, rgba(44,44,44, .85), rgba(55, 55, 55, .85)' : ''"
    >
        <v-container fill-height>
                <v-sheet
                        color="transparent"
                        
                        class="text-style w-100"
                >
                <div v-html="welcometitle">

                </div>
        <!-- <h3 class="container font-weight-bolder">Find verified online businesses that delivers to your location</h3> -->

        <home-search :flower="'mb-0 col-md-7'" :flowe="'d-none d-md-block'" class="putmecenter" />

                </v-sheet>
        </v-container>
    </v-img>
        </v-row>
      </section>
      <section class="mb-12 mt-12">
    <h4 class="text-center text-capitalize text-fonts font-weight-bold">what we provide</h4>

  <v-row>
    <v-col
      cols="12"
      sm="4"
      class="putmecenter"
    >
      <v-hover
        v-slot="{ hover }"
        open-delay="200"
      >
        <v-card
          :elevation="hover ? 16 : 2"
          :class="{ 'on-hover': hover }"
          class="text-center"
          max-width="350"
        >
            <div class="avatar avatar-xl mb-1">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-lg text-find" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"></path><path d="M9 12l2 2l4 -4"></path><path d="M12 3a12 12 0 0 0 8.5 3a12 12 0 0 1 -8.5 15a12 12 0 0 1 -8.5 -15a12 12 0 0 0 8.5 -3"></path></svg>
            </div>
            <br>
            Verified Businesses
            <!-- Reduce cyber or internet business fraud -->
            <v-card-text>
              Providing verified online businesses and services to help minimize cyber or internet fraud
              <!-- Real online stores and services; preventing cyber or internet fraud -->
            </v-card-text>
        </v-card>
      </v-hover>
    </v-col>
    <v-col
      cols="12"
      sm="4"
      class="putmecenter"
    >
      <v-hover
        v-slot="{ hover }"
        open-delay="200"
      >
        <v-card
          :elevation="hover ? 16 : 2"
          :class="{ 'on-hover': hover }"
          class="text-center"
          max-width="350"
        >
            <div class="avatar avatar-xl mb-1">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-lg text-find" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"></path><path d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0"></path><path d="M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0"></path><line x1="3" y1="6" x2="3" y2="19"></line><line x1="12" y1="6" x2="12" y2="19"></line><line x1="21" y1="6" x2="21" y2="19"></line></svg>
            </div>
            <br>
            Information
            <v-card-text>
              <!-- Find online businesses that deals with what you are looking for; contact cards, social media accounts, links e.t.c. -->
              <!-- Find contact informations on businesses that deals with what you are looking for -->
              Giving internet customers easier means to find online businesses that deals with what they are looking for
            </v-card-text>
        </v-card>
      </v-hover>
    </v-col>
    <v-col
      cols="12"
      sm="4"
      class="putmecenter"
    >
      <v-hover
        v-slot="{ hover }"
        open-delay="200"
      >
        <v-card
          :elevation="hover ? 16 : 2"
          :class="{ 'on-hover': hover }"
          class="text-center"
          max-width="350"
        >
            <div class="avatar avatar-xl mb-1">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-lg text-find" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z"></path><path d="M12 17.75l-6.172 3.245 1.179-6.873-4.993-4.867 6.9-1.002L12 2l3.086 6.253 6.9 1.002-4.993 4.867 1.179 6.873z"></path></svg>
            </div>
            <br>
            Rating & Reviews
            <v-card-text>
              Rate and review your experience of an online business, view ratings and reviews of others too.
            </v-card-text>
        </v-card>
      </v-hover>
    </v-col>

  </v-row>
      </section>
  <section class="container py-5 mb-12 mt-12">

  <h5 class="container">Browse internet businesses in {{located.location}} by categories</h5>
  <v-row class=" ">
    <!-- <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="'/location/' + located.slug + '/category/food-ordering'"
        
      >
        <v-icon
        large
        color="success lighten-1"
        >mdi-food</v-icon>

        <v-card-text>
          Food Ordering
        </v-card-text>

      </v-card>
    </v-col>
    <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="'/location/' + located.slug + '/category/gadgets-shop'"
      >
        <v-icon
        large
        >mdi-cellphone-link</v-icon>

        <v-card-text>
          Gadgets Shop
        </v-card-text>

      </v-card>
    </v-col>
    <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="'/location/' + located.slug + '/category/fashion-store'"
      >
        <v-icon
        large
        color="success lighten-1"
        >mdi-tshirt-crew</v-icon>

        <v-card-text>
          Fashion
        </v-card-text>

      </v-card>
    </v-col>
    <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="'/location/' + located.slug + '/category/news-blog'"
      >
        <v-icon
        large
        color="black"
        >mdi-newspaper</v-icon>

        <v-card-text>
          News Blog
        </v-card-text>

      </v-card>
    </v-col>
    <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="'/location/' + located.slug + '/category/forex-trading'"
      >
        <v-icon
        large
        color="yellow darken-3"
        >mdi-currency-usd-circle</v-icon>

        <v-card-text>
          Forex Trading
        </v-card-text>

      </v-card>
    </v-col>
    <v-col
      cols="6"
      sm="4"
      class="justify-content-center text-center align-content-center"
    >
      <v-card
        class="text-center"
        :href="'/location/' + located.slug + '/category/interiors'"
      >
        <v-icon
        large
        color="success"
        >mdi-flower-outline</v-icon>

        <v-card-text>
          Interiors
        </v-card-text>

      </v-card>
    </v-col> -->
    <slot />
  </v-row>
  </section>

  </div>
</wrapper>
</template>

<script>
import HomeSearch from '..//components/HomeSearch'
import Wrapper from '..//layouts/default'

export default {
  props: ['welcometitle', 'sourced'],
  components:{
    HomeSearch,
    Wrapper,
  },
  data() {
    return {
      address: '',
      valid: false,
      locate: '',
      located: this.locate || {location: 'Nigeria', slug: 'nigeria'},
    }
  },

}
</script>
<style lang="sass" scoped>
.v-card.on-hover.theme--dark
  background-color: rgba(#FFF, 0.8)
  >.v-card__text
    color: #000
</style>
<style>
.putmecenter {
  text-align: -webkit-center;
}
</style>