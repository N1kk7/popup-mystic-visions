<!-- /pages/cancel.vue -->
<template>
  <div class="cancel-page">
    <h1>Payment was cancelled </h1>

    <img src="/cancel.webp" alt="cancel" width="50" height="50" />

    <div class="wrapper_info">
      <div class="head_info">
        <img src="/images/sphinks.webp" alt="sphinks" width="50" height="50" />
        <span>
          Oops, payment not completed
        </span>
      </div>

      <div class="details_content">
        <span class="order_details">
          What happened?
        </span>
        <p>
          It looks like you cancelled the payment process.  
          Don’t worry — you can try again anytime.
        </p>

        <div class="button_wrapper">
            <NuxtLink to="/" class="retry_btn">
                🔄 Return to Home
            </NuxtLink>
        </div>

    
      </div>
    </div>
  </div>
</template>


<style scoped lang="scss">
.cancel-page {
  max-width: 60vw;
  min-height: 50vh;
  margin: 50px auto;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 2em;
}

.wrapper_info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border: 1px solid var(--text-color);
  border-radius: 10px;
  padding: 15px;
  gap: 2em;
}

.head_info {
  display: flex;
  justify-content: center;
  align-items: flex-end;
  gap: 1em;

  span {
    font-size: 1.5em;
    font-weight: 600;
    color: var(--text-color);
  }
}

.details_content {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  gap: 1em;

  .order_details {
    font-size: 1.2em;
    font-weight: 600;
    color: var(--text-color);
  }

  .button_wrapper{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }



  .retry_btn {
    display: inline-block;
    margin-top: 1em;
    padding: 0.5em 1em;
    border-radius: 8px;
    background: var(--text-color);
    color: white;
    text-decoration: none;
    font-weight: 600;

    &:hover {
      opacity: 0.8;
    }
  }
}
</style>
