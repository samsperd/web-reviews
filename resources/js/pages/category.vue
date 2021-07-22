<template>
    <div>
         <div>
            <v-btn @click.stop="categoryBox = true" x-small rounded color="grey lighten-2" class="text-black-50">
                <v-icon color="black">mdi-view-grid</v-icon>
                Change category
              </v-btn>
            <v-btn @click.stop="locationBox = true" x-small rounded color="grey lighten-2" class="text-black-50">
                <v-icon color="black">mdi-navigation</v-icon>
                Change location
              </v-btn>

         </div>
    <v-dialog
      v-model="locationBox"
      max-width="500px"
    >
      <v-card>
        <v-toolbar color="white">
          <v-toolbar-title >
          Change Location
          <v-icon>mdi-navigation</v-icon>
          </v-toolbar-title>
          <v-spacer></v-spacer>
          <v-btn
          light
          icon
          @click="locationBox = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-toolbar>
        <v-card-text>
          <v-list>
            <v-list-item
            v-for="(locationd, indeee) in locations" :key="indeee"
            :href="'/location/'+ locationd.slug+'/category/' + category.slug "
            >
              <v-list-item-content>
                <v-list-item-title v-text="locationd.location"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-card-text>

      </v-card>
    </v-dialog>
    <v-dialog
      v-model="categoryBox"
      max-width="500px"
    >
      <v-card>
        <v-toolbar color="white">
          <v-toolbar-title >
          By category
          <v-icon>mdi-view-grid</v-icon>
          </v-toolbar-title>
          <v-spacer></v-spacer>
          <v-btn
          light
          icon
          @click="categoryBox = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-toolbar>

        <v-card-text>
          <v-list>
            <v-list-item
            v-for="(categoryy, indeeee) in categories" :key="indeeee"
            :href="'/location/' + location +'/category/' + categoryy.slug"
            >
              <v-list-item-content>
                <v-list-item-title v-text="categoryy.name"></v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-card-text>

      </v-card>
    </v-dialog>
    

          <h4 class="text-capitalize col-12 font-weight-bold">The Best {{location}} {{category.name}} online businesses</h4>
              <div v-if="sponsoredGroups.length > 0">
                <v-divider></v-divider>
                <h5>Sponsored results
                  <v-icon dark color="yellow darken-3">mdi-star-circle</v-icon>
                </h5>
                <div
                  v-for="(sponsored, inde) in sponsoredGroups" :key="inde"
                >
                          <v-card
                          class="text-decoration-none"
                          flat
                          :href="'/business/'+sponsored.slug"
                        >
                            <v-list-item class="grow" >
                              <v-list-item-avatar color="grey darken-3">
                                <v-img
                                  class="elevation-6"
                                  alt=""
                                  :src="'/storage/'+sponsored.image"
                                ></v-img>
                              </v-list-item-avatar>

                              <v-list-item-content>
                                <v-list-item-title style="white-space: normal !important; text-decoration: underline !important;">
                                  {{sponsored.title}}
                                </v-list-item-title>
                            <span class="text-muted small">
                              <template v-for="(category, index) in sponsored.category">
                                <template v-if="index > 0">
                                  ,
                                </template>
                                <span :key="index">{{category.name}}</span>
                              </template>

                              
                            </span>
                              </v-list-item-content>
                              <v-row
                                align="center"
                                justify="end"
                              >
                              <v-icon>mdi-navigation</v-icon>
                              {{sponsored.location.location}}
                              </v-row>
                            </v-list-item>
                          <v-card-text class="col-12">
                            <v-row
                              align="center"
                              class="mx-0"
                            >
                              <v-rating
                                :value="sponsored.rate"
                                dark
                                color="amber"
                                dense
                                half-increments
                                readonly
                                size="14"
                              ></v-rating>

                              <div class="grey--text ml-4">
                                4.5 (1)
                              </div>
                            </v-row>
                          </v-card-text>
                          <v-card-subtitle>
                            {{sponsored.excerpt}}
                          </v-card-subtitle>
                          <v-card-actions>
                          <v-row
                          justify="end"
                          >
                            <v-btn 
                          color="success lighten-2"
                          large
                          v-if="sponsored.company_number"
                          :href="'tel:'+sponsored.company_number"
                            icon>
                              <v-icon color="dark">mdi-phone-outgoing-outline</v-icon>
                            </v-btn>
                            <v-btn 
                          color="success lighten-3"
                          large
                          v-if="sponsored.company_email"
                          :href="'mailto:'+sponsored.company_email"
                          target="blank"
                            icon>
                              <v-icon color="dark">mdi-email-outline</v-icon>
                            </v-btn>
                            <v-btn 
                          color="deep-purple lighten-2"
                          large
                          v-if="sponsored.instagram"
                          target="blank"
                          :href="'https://www.instagram.com/'+sponsored.instagram"    
                            icon>
                              <v-icon color="pink darken-1">mdi-instagram</v-icon>
                            </v-btn>
                            <v-btn 
                          color="deep-purple lighten-2"
                            icon
                            large
                            target="blank"
                          v-if="sponsored.twitter"
                          :href="'https://www.twitter.com/'+sponsored.twitter"    
                            
                            >
                              <v-icon color="light-blue lighten-3">mdi-twitter</v-icon>
                            </v-btn>
                            <v-btn icon
                            v-if="sponsored.facebook"
                             large target="blank" :href="'https://www.facebook.com/'+sponsored.facebook">
                              <v-icon color="indigo">mdi-facebook</v-icon>

                            </v-btn>
                            <v-btn 
                          color="success"
                          large
                          v-if="sponsored.whatsapp"
                          :href="sponsored.whatsapp"
                          target="blank"
                            icon>
                              <v-icon color="dark">mdi-whatsapp</v-icon>
                              
                            </v-btn>

                          </v-row>


                          </v-card-actions>
                        </v-card>
                        <v-divider></v-divider>

                </div>
              </div>
              <div v-if="searched.length > 0">
                <v-divider></v-divider>
                <h6 class="font-weight-bold">All Results
                </h6>
                <div
                  v-for="(post, index) in searched" :key="index"
                >
                  <v-card
                    class="text-decoration-none"
                    flat
                    :href="'/business/'+post.slug"
                  >
                      <v-list-item class="grow" >
                        <v-list-item-avatar color="grey darken-3">
                          <v-img
                            class="elevation-6"
                            alt=""
                            :src="'/storage/'+post.image"
                          ></v-img>
                        </v-list-item-avatar>

                        <v-list-item-content>
                          <v-list-item-title style="white-space: normal !important;" v-text="post.title"></v-list-item-title>
                      <span class="text-muted small">
                        <template v-for="(category, index) in post.category">
                          <template v-if="index > 0">
                            ,
                          </template>
                          <span :key="index">{{category.name}}</span>
                        </template>

                        
                      </span>
                        </v-list-item-content>
                        <v-row
                          align="center"
                          justify="end"
                        >
                        <v-icon>mdi-navigation</v-icon>
                        {{post.location.location}}
                        </v-row>
                      </v-list-item>
                    <v-card-text class="col-12">
                      <v-row
                        align="center"
                        class="mx-0"
                      >
                        <v-rating
                          :value="post.rate"
                          dark
                          color="amber"
                          dense
                          half-increments
                          readonly
                          size="14"
                        ></v-rating>

                        <div class="grey--text ml-4">
                          4.5 (1)
                        </div>
                      </v-row>
                    </v-card-text>
                    <v-card-subtitle>
                      {{post.excerpt}}
                    </v-card-subtitle>
                    <v-card-actions>
                    <v-row
                    justify="end"
                    >
                      <v-btn 
                    color="success lighten-2"
                    large
                    v-if="post.company_number"
                    :href="'tel:'+post.company_number"
                      icon>
                        <v-icon color="dark">mdi-phone-outgoing-outline</v-icon>
                      </v-btn>
                      <v-btn 
                    color="success lighten-3"
                    large
                    v-if="post.company_email"
                    :href="'mailto:'+post.company_email"
                    target="blank"
                      icon>
                        <v-icon color="dark">mdi-email-outline</v-icon>
                      </v-btn>
                      <v-btn 
                    color="deep-purple lighten-2"
                    large
                    v-if="post.instagram"
                    target="blank"
                    :href="'https://www.instagram.com/'+post.instagram"    
                      icon>
                        <v-icon color="pink darken-1">mdi-instagram</v-icon>
                      </v-btn>
                      <v-btn 
                    color="deep-purple lighten-2"
                      icon
                      large
                      target="blank"
                    v-if="post.twitter"
                    :href="'https://www.twitter.com/'+post.twitter"    
                      
                      >
                        <v-icon color="light-blue lighten-3">mdi-twitter</v-icon>
                      </v-btn>
                      <v-btn icon
                      v-if="post.facebook"
                      large target="blank" :href="'https://www.facebook.com/'+post.facebook">
                        <v-icon color="indigo">mdi-facebook</v-icon>

                      </v-btn>
                      <v-btn 
                    color="success"
                    large
                    v-if="post.whatsapp"
                    :href="post.whatsapp"
                    target="blank"
                      icon>
                        <v-icon color="dark">mdi-whatsapp</v-icon>
                        
                      </v-btn>

                    </v-row>


                    </v-card-actions>
                  </v-card>
                  <v-divider></v-divider>
                </div>
              </div>
          <infinite-loading @infinite="infiniteHandler"></infinite-loading>
    </div>
</template>
<script>
export default {
  props: ['locationSlug', 'categorySlug'],
    data() {
        return {
            searched: [],
            location: this.locationSlug,
            category: '',
            limitList: 5,
            limit: true,
            page: 1,
            locationBox: false,
            locations: [],
            categoryBox: false,
            categories: [],
            sponsoredGroups: []
            
        }
    },
    created() {
      this.sponsoredRequests();
      if (this.$refs.InfiniteLoading) {
        this.$refs.InfiniteLoading.stateChanger.reset();
      }
    },
    methods: {
        infiniteHandler($state) {
          let vm  = this;
            axios.post('/api/category?page='+this.page,{location: this.locationSlug, cate: this.categorySlug, page:this.page})
                .then((response)=>{
                  vm.locations = response.data.locations;
                  vm.categories = response.data.categories;
                  let thsin = response.data.posts.data;
                    this.category = response.data.category;
                  if (thsin.length) {
                    this.page += 1;
                    vm.searched.push(...thsin);
                    $state.loaded();
                  } else {
                    $state.complete();
                  }

                }).catch(err => {
                    // alert('Please Reload');
                    // location.reload();

                });
                      
        },
        sponsoredRequests() {
            axios.post('/api/sponsoredcategory',{location: this.locationSlug, cate: this.categorySlug} )
                .then((response)=>{
                    this.sponsoredGroups.push(...response.data.posts);
                }).catch(err => {
                    // alert('Please Reload');
                    // location.reload();
                  console.log(err);
                });    
        }
    },

}
</script>