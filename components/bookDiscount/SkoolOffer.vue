<template>
  <div class="question_block">
    <div class="content text">
      <div class="text_content">
          <h1>
            Congratulations - You've Been Selected! 
          </h1>
          

        
       <div class="note">
                <span class="alternative_text">
                    Begin your  
                    <strong>
                      7-day free trial
                    </strong> of 
                    <strong>
                      Empyrean
                    </strong>
                    (our private Skool community) and unlock a
                    <strong>
                      50% discount
                    </strong>
                    on <br>
                    <i>
                      The Pillars of Wisdom.
                    </i> 

                  </span>
                </div>

                <p class="alternative_text">
                    If you’d like to get the book right away
                    <strong>
                        without subscribing, 
                    </strong>
                    click the button below to purchase it at full price.
                </p>
      </div>
    </div>
    <div class="content">
      <img src="~/public/images/skool-offer-popup-1200.webp" alt="book" />
    </div>
  </div>
</template>

<script setup></script>

<style lang="scss" scoped>
.question_block {
  display: flex;
  justify-content: space-between;
  flex-direction: row-reverse;
  overflow: hidden;
  align-items: center;
  position: absolute;
  top: 0;
  left: 0;
  padding: 0;
  gap: 1em;
  width: 100%;
  height: 100%;
  @media screen and (max-width: 768px) {
    & {
      display: block;
    }
  }
}
.content {
  flex: 1;
  height: 100%;

  img {
    height: 100%;
    width: 100%;
    object-fit: cover;
  }

  @media screen and (max-width: 768px) {
    & {
      display: block;
      position: absolute;
      width: 100%;
      height: -webkit-fill-available;
      top: 0;
      left: 0;

      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
  }
}
.text {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  padding: 1em;
  padding-left: 0;
  height: 100%;

  @media screen and (max-width: 768px) {
    & {
      z-index: 1;
      padding: 0;
      color: white;
      background: linear-gradient(
        to bottom,
        rgba(0, 0, 0, 0.2),
        rgba(0, 0, 0, 0.9)
      );
    }
  }

  @media screen and (max-width: 375px) {
    &{
      background: linear-gradient(
        to bottom,
        rgba(0, 0, 0, 0.5),
        rgba(0, 0, 0, 0.9)
      );
    }

  }
}
.text_content {
  display: flex;
  align-items: flex-start;
  justify-content: center;
  flex-direction: column;
  height: 100%;
  gap: 2em;

  @media screen and (max-width: 768px) {
    &{
      gap: 3vh;

    }
  }

  @media screen and (max-width: 768px) {
    & {
      padding: 2em 2em 7em;
      justify-content: flex-end;
    }
  }
  @media screen and (max-width: 425px) {
    & {
      padding: 2em 1em 3em
    }
  }

  @media screen and (max-width: 375px) {

    &{
      overflow: auto;
      justify-content: flex-start;
    }
    
  }


  h1 {
    font-size: 1.1rem;
    text-align: left;
    font-weight: 600;
    color: var(--text-color);
    @media screen and (max-width: 768px) {
      & {
        font-size: clamp(0.8em, 5vw, 1.5em);
        color: white;
      }
    }
  }

  .note{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    background-color: rgba(209, 171, 244, 0.25);
    border-radius: 8px;
    padding: 1rem 1rem 1rem 2rem;
    position: relative;
    font-family: 'Roboto', sans-serif;
    gap: 10px;
    &{
      @media screen and (max-width: 768px) {
        &{
          background-color: rgba(142, 35, 241, 0.6);
        }
      }
    }
    &::before{
      content: '';
      position: absolute;
      top: 1rem;
      left: 1rem;
      width: 3px;
      border-radius: 1px;
      height: calc(100% - 2rem);
      background: var(--text-color);
      @media screen and (max-width: 768px) {
        &{
          background: rgba(209, 171, 244, 0.75);
        }
      }
     
      
    }

    p{
      font-weight: 500;
      font-size: 0.8em;
      text-align: left;
      strong{
        color: var(--text-color);
      }
      @media screen and (max-width: 768px) {
        & {
          font-size: clamp(0.6em, 4vw, 1em);
          color: white;
        }
      }
    }

    

  }

  .alternative_text{
      font-size: 1.2rem;
      font-weight: 500;
      font-family: 'DMSerifDisplay-Medium';
      strong , i{
        color: var(--text-color);
        @media screen and (max-width: 768px) {
          & {
            color: white;
          }
        }
      }
      i{
        font-weight: 600;
        white-space: nowrap;
      }
      @media screen and (max-width: 768px) {
        & {

            color: white;

        }
        
      }
    }


  
}
</style>
