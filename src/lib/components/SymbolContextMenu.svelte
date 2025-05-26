<script lang="ts">
   import BranchFlowIcon from "../../Icon/BranchFlowIcon.svelte";
   import DbfLowIcon from "../../Icon/DBFLowIcon.svelte";
    import IoFlowIcon from "../../Icon/IoFlowIcon.svelte";
    import OffpageFlowIcon from "../../Icon/OffpageFlowIcon.svelte";
    import OnpageFlowIcon from "../../Icon/OnpageFlowIcon.svelte";
   import ProcessFlowIcon from "../../Icon/ProcessFlowIcon.svelte";
   import StartFlowIcon from "../../Icon/StartFlowIcon.svelte";

   const symbols = [
      {
         title: "start",
         icon: StartFlowIcon,
      },
      
      {
         title: "io",
         icon: IoFlowIcon,
      },
      {
         title: "branch",
         icon: BranchFlowIcon,
      },
      {
         title: "process",
         icon: ProcessFlowIcon,
      },
      {
         title: "db",
         icon: DbfLowIcon,
      },
      {
         title: "offpage",
         icon: OffpageFlowIcon,
      },
      {
         title: "onpage",
         icon: OnpageFlowIcon,
      },
   ];
   let {
      onclick,
      paneContextMenu = $bindable(),
   }: { [key: string]: any; onclick: (e: MouseEvent, type: string) => void } =
      $props();
</script>

<div
   bind:this={paneContextMenu}
   class="menu bg-base-200 absolute hidden text-sm rounded-box grid-cols-5"
>
   <!-- svelte-ignore a11y_consider_explicit_label -->
   {#each symbols as symbol}
      <button
         onclick={(e) => onclick(e, symbol.title)}
         class=" hover:bg-gray-700 cursor-pointer rounded-lg p-1 flex justify-center items-center"
      >
         <symbol.icon />
      </button>
   {/each}
</div>
