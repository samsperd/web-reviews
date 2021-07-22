<template>
<apper>
  <div>
      <v-app-bar
      color="white"
      app
      >
    <v-btn
    href="/"
    light
    active-class="text-decoration-none"
    class="font-weight-bold font-italic text-capitalize"
    depressed
    >
      <v-img
      :src="'/images/CKBM7774.PNG'"
      max-width="160"
      >

      </v-img>
      <!-- Businessgrills -->
    </v-btn>

      <v-spacer></v-spacer>
      <v-btn @click.stop="search = !search" icon><v-icon>mdi-magnify</v-icon></v-btn>
      <span class="d-none d-md-block">
      <v-btn class="text-capitalize" href="/categories" depressed color="white" >Categories</v-btn>
      <v-btn class="text-capitalize" href="/contact-us" depressed color="white" >Contact Us</v-btn>
      <v-btn class="text-capitalize" href="/donate" depressed color="white" >Donate</v-btn>
      </span>
      <span class="d-block d-md-none">
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      </span>
    </v-app-bar>
        <v-navigation-drawer
      v-model="drawer"
      app
      right
      temporary
      class="d-block d-md-none"
    >
    <v-list-item-group
          v-model="group"
          active-class="green--text"
        >
          <v-list-item
          href="/categories"
          >
            <v-list-item-title>Categories</v-list-item-title>
          </v-list-item>
          <v-list-item
           href="/contact-us"
          >
            <v-list-item-title>Contact Us</v-list-item-title>
          </v-list-item>
          <v-list-item
          href="/donate"
          >
            <v-list-item-title>Donate</v-list-item-title>
          </v-list-item>
        </v-list-item-group>

    </v-navigation-drawer>
    <v-navigation-drawer
      v-model="search"
      app
      temporary
      class="bigtipper"
    >
    <v-app-bar>
      Search
      <v-spacer></v-spacer>
      <v-btn @click.stop="search = !search" icon><v-icon>mdi-close</v-icon></v-btn>
    </v-app-bar>
    <v-main>
      <search :flower="'mb-0 col-md-12'" :flowe="'d-block'" />
    </v-main>


    </v-navigation-drawer>
  </div>
  <v-container>
    <v-main>
      <slot />
    </v-main>
  </v-container>
    <div>
        <section class="bg-dark shadow">
                <v-container grid-list-md class="text-center">
                    <v-btn href="/terms" plain dark class="text-capitalize">Terms & Conditions</v-btn>
                    <v-btn href="/privacy" plain dark class="text-capitalize">Privacy policies</v-btn>
                </v-container>
        </section>
    </div>
  </apper>
</template>

<script>
import Search from '..//components/HomeSearch'
import Apper from '..//components/App'

export default {
  components: {
    Search,
    Apper
  },
  data() {
    return {
      drawer: false,
    group: null,
    search: false,
    }
  },
  watch: {
    group () {
      this.drawer = false
    },
  },
  methods: {
  }
}
</script>

<style scoped>
.profile-photo {
  width: 2rem;
  height: 2rem;
  margin: -.375rem 0;
}
.bigtipper {
  width: 350px !important;
}
@media screen and (max-width: 760px){
  .bigtipper{width: 100vw !important; margin: 0;}
}
</style>
