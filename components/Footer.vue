<template>
  <div class="footer">
    <div class="conntainer">
      <div class="footer_content">
        <div class="footer_content_top">
          <img src="/images/logo.png" alt="logo" />

          <NuxtLink to="mailto:mysty.vis@gmail.com">
            <svg
              version="1.0"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 512.000000 512.000000"
              preserveAspectRatio="xMidYMid meet"
            >
              <g
                transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                fill="rgb(0,0,0)"
                stroke="none"
              >
                <path
                  d="M340 4469 c-160 -31 -299 -173 -330 -339 -14 -72 -14 -3067 0 -3141
              32 -169 170 -307 340 -339 73 -14 4347 -14 4420 0 170 32 308 170 340 339 14
              74 14 3068 0 3142 -32 169 -170 307 -340 339 -67 13 -4365 12 -4430 -1z m4374
              -208 c19 -7 -210 -221 -1517 -1409 -526 -479 -507 -463 -552 -483 -51 -24
              -119 -24 -171 0 -38 17 -508 440 -1628 1465 -378 346 -455 421 -440 427 25 10
              4283 10 4308 0z m-3648 -917 c462 -421 840 -769 842 -773 1 -5 -91 -91 -205
              -192 -288 -255 -641 -580 -1086 -998 -208 -196 -381 -357 -386 -359 -5 -2 -11
              7 -15 20 -8 30 -8 2996 0 3037 4 17 8 31 9 31 2 0 380 -344 841 -766z m3843
              -779 c0 -825 -2 -1510 -5 -1523 -4 -13 -10 -22 -15 -20 -5 2 -178 163 -386
              359 -445 418 -798 743 -1086 998 -114 101 -206 187 -205 192 2 4 381 353 843
              775 763 697 840 764 846 743 4 -13 7 -699 8 -1524z m-2712 -251 c171 -153 278
              -196 426 -173 98 15 170 57 301 174 102 92 120 104 135 93 120 -94 675 -599
              1249 -1137 380 -356 430 -407 410 -413 -13 -3 -984 -6 -2158 -6 -1174 0 -2145
              3 -2158 6 -20 6 31 57 410 413 238 223 516 482 618 575 192 177 639 574 645
              574 2 0 57 -47 122 -106z"
                />
              </g>
            </svg>
          </NuxtLink>
        </div>

        <div class="footer_content_bottom">
          <div class="info">
            <div class="final">2026 Mystic Visions LLC</div>

            <div class="text">
              A framework for evaluating environments and tradeoffs.
            </div>
          </div>
          <div class="right_column">
            <div class="right_column_top">
              <span> Paperback & Hardcover </span>
              <span> Ships Worldwide </span>
              <span> Secure Checkout </span>
            </div>

            <nav>
              <ul>
                <li><NuxtLink to="/privacy-policy">Privacy Policy</NuxtLink></li>
                <li><NuxtLink to="/return-policy">Return Policy</NuxtLink></li>
                <!-- <li><NuxtLink to="/">Privacy Policy</NuxtLink></li> -->
                <li>
                  <NuxtLink to="mailto:mysty.vis@gmail.com"
                    >Contact Us</NuxtLink
                  >
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup></script>

<style scoped lang="scss">
.footer {
  width: 100%;
  height: auto;
  padding: 96px 0 40px;
  position: relative;
  background: #111318;
  color: white;

  &_content {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    justify-content: center;

    &_top {
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      padding-bottom: 30px;

      width: 100%;
      height: auto;
      display: flex;
      justify-content: space-between;
      align-items: flex-start;

      img {
        max-height: 24px;
        width: clamp(100px, 62vw, 410px);
        filter: invert(1);
        mix-blend-mode: lighten;

        @media screen and (max-width: 480px) {
          width: 100%;
        }
      }

      a {
        display: flex;
        justify-content: center;
        align-items: center;
        background: #edf0f4;
        cursor: pointer;
        padding: 5px;
        border-radius: 50%;
        transform: translateY(10px);
        svg {
          width: 17px;
          height: 15px;
        }

        @media screen and (max-width: 1024px) {
          transform: translateY(0);
        }
      }

      @media screen and (max-width: 480px) {
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        gap: 20px;
      }
    }

    &_bottom {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-block: 25px;
      gap: 20px;

      .info {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        gap: 20px;

        .text {
          white-space: nowrap;
        }

        .text,
        .final {
          white-space: nowrap;
          font-size: clamp(0.8rem, 2.5vw, 1rem);
          font-family: "Libre Baskerville", sans-serif;

          font-weight: 500;
          font-style: normal;
          line-height: 150%;
          @media screen and (max-width: 480px) {
            white-space: unset;
          }
        }

        @media screen and (max-width: 1024px) {
          flex-direction: column-reverse;
        }
        @media screen and (max-width: 480px) {
          gap: 15px;
        }
      }

      .right_column {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-end;
        gap: 24px;

        &_top {
          display: flex;
          justify-content: flex-end;
          align-items: center;
          gap: 10px;

          span {
            white-space: nowrap;
            font-size: clamp(0.8rem, 2.5vw, 1rem);
            font-family: "Libre Baskerville", sans-serif;
            font-weight: 500;
            font-style: normal;
            line-height: 150%;
            @media screen and (max-width: 480px) {
              white-space: unset;
            }
          }

          @media screen and (max-width: 480px) {
            justify-content: flex-start;
            gap: 8px;
            flex-wrap: wrap;
          }
        }

        nav ul {
          display: flex;
          align-items: center;
          justify-content: flex-end;
          gap: 10px;

          li {
            list-style: none;

            a {
              display: inline-flex;
              align-items: center;
              white-space: nowrap;

              font-size: clamp(0.8rem, 2.5vw, 1rem);
              font-family: "Libre Baskerville", sans-serif;
              font-weight: 500;
              line-height: 150%;
              color: white;
              text-decoration: none;
            }
          }
        }

        @media screen and (max-width: 1024px) {
          border-bottom: 1px solid rgba(255, 255, 255, 0.1);
          padding-bottom: 30px;
          align-items: flex-start;
          width: 100%;
        }
        @media screen and (max-width: 480px) {
          gap: 15px;
        }
      }

      @media screen and (max-width: 1024px) {
        flex-direction: column-reverse;
        justify-content: flex-start;
        align-items: flex-start;
        gap: 30px;
      }
    }
  }

  @media screen and (max-width: 768px) {
    padding: 75px 0 35px;
  }
  @media screen and (max-width: 480px) {
    padding: 50px 0 25px;
  }
}
</style>
