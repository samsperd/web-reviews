<template>
    <div>
          <v-form class="container-fluid" @submit.prevent="find" id="find-form">
        <v-row class="col-12">
              
            <v-autocomplete
                v-model="term"
                @keyup.enter="find"
                @keyup="searching($event)"
                :search-input.sync="tim"
                @change="findIt"
                type="Search"
                solo
                :items="dree"
                hide-no-data
                hide-details
                cache-items
                no-data-text="Suggested"
                placeholder="Find keywords, products, services, business"
                :class="flower"
                prepend-inner-icon="mdi-magnify"
                append-icon=""
            >
            </v-autocomplete>


          <v-autocomplete
            v-model="located"
            @keyup.enter="find"
            type="search"
            class="mt-0"
            color="black"
            label="Location"
            solo
            prepend-inner-icon="mdi-map-marker"
            :items="allLocations"
            item-text="location"
            return-object
            placeholder="Location"
            append-icon=""
          ></v-autocomplete>
          <input type="submit" hidden>
          <v-btn color="success" type="submit" form="find-form" style="height: 50px;" tile :class="flowe"> <v-icon>mdi-magnify</v-icon></v-btn>
        </v-row>
          </v-form>        
    </div>
</template>
<script>

export default {
    props: ['flower', 'flowe'],
    data() {
      return {
        term: null,
        allPosts: '',
        located: {location: 'Nigeria', slug: 'nigeria'} ,
        allLocations: [],
        dree: [],
        tim: null,
      }
    },
    created() {
        this.all();
    },
    methods: {
        all() {
        axios.get('/api/location')
            .then((response)=>{
                this.allLocations = response.data.locations;
            }).catch(err => {

            });
        },
        find() {
            if (this.located.slug == null) {
                this.located = {location: 'Worldwide', slug: 'worldwide'}
            }
            if (this.tim == null || this.tim == '') {
                window.location = '/browse-location/'+ this.located.slug;
            }
            else {
                var term = this.tim;
                var termPlus = term.toLowerCase()
                                .trim()
                                .split(' ')
                                .join('-')
                window.location = '/search/'+this.located.slug+'/'+termPlus;
            }
        },
        findIt() {
            if (this.located.slug == null) {
                this.located = {location: 'Worldwide', slug: 'worldwide'}
            }
            if (this.term == null || this.term == '') {
                window.location = '/browse-location/'+ this.located.slug;
            }
            else {
                var term = this.term;
                var termPlus = term.toLowerCase()
                                .trim()
                                .split(' ')
                                .join('-')
                window.location = '/search/'+this.located.slug+'/'+termPlus;
            }
        },
        searching(event) {
          var searcher = event.target.value;
          axios.post('/api/searching', {term: searcher})
            .then((response)=>{
                this.dree = response.data.posts;
            }).catch(err => {

            });


        },
        addPlus(termed) {
          return termed
            .toLowerCase()
            .trim()
            .split(' ').join('-');
        }

    },

}
</script>
<style>
.v-autocomplete:not(.v-input--is-disabled).v-select.v-text-field input {
    color: rgb(24, 24, 24) !important;
}
</style>