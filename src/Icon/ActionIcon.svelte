<script>
   const { class: className = "", overrideSize = false } = $props();
</script>

<svg
   xmlns="http://www.w3.org/2000/svg"
   fill="currentColor"
   viewBox="0 0 24 24"
   stroke-width="1.5"
   stroke="currentColor"
   class="{overrideSize ? '' : 'size-5'} {className}"
>
   <path
      stroke-linecap="round"
      stroke-linejoin="round"
      d="m3.75 13.5 10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75Z"
   />
</svg>
