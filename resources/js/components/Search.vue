<template>
    <div>
          <v-form class="container-fluid" @submit.prevent="search" id="searched-form">
        <v-row class="col-12">
              <v-text-field
                v-model="term"
                @keyup.enter="search"
                type="Search"
                solo
                placeholder="Find products, services, category or business"
                :class="flower"
                prepend-inner-icon="mdi-magnify"
              >

              </v-text-field>

            <!-- <v-autocomplete
                v-model="term"
                @keyup.enter="search"
                type="Search"
                solo
                placeholder="Find products, services, category or business"
                :class="flower"
                prepend-inner-icon="mdi-magnify"
            >
              <template v-slot:item="">


              </template>
            </v-autocomplete> -->





          <v-autocomplete
            v-model="located"
            @keyup.enter="search"
            type="search"
            class="mt-0"
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
          <v-btn color="success" type="submit" form="searched-form" style="height: 50px;" tile class="d-none d-md-block"> <v-icon>mdi-magnify</v-icon></v-btn>
        </v-row>
          </v-form>        
    </div>
</template>
<script>

export default {
    props: ['flower'],
    data: () => ( {
    }),
    data() {
      return {
        term: null,
        allPosts: '',
        located: {location: 'Nigeria', slug: 'nigeria'} ,
        allLocations: [],
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
                // alert('Please Reload');
                // location.reload();

            });
        },

        search() {
            if (this.located.slug == null) {
                this.located = {location: 'Worldwide', slug: 'worldwide'}
            }
        if (this.term == null || this.term == '') {
            window.location = '/browse-location/'+ this.located.slug;
            // this.$router.push({ name: 'browse', params: {'located': this.located} });
        }
        else {
                var term = this.term;
                var termPlus = term.toLowerCase()
                                    .trim()
                                    .split(' ')
                                    .join('+');
                window.location = '/location-'+this.located.slug+'/'+termPlus;

        }
        }

    },

}
</script>