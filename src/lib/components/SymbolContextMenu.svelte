<script lang="ts">
   import BranchFlowIcon from "../../Icon/BranchFlowIcon.svelte";
   import DbfLowIcon from "../../Icon/DBFLowIcon.svelte";
   import DelayFlowIcon from "../../Icon/DelayFlowIcon.svelte";
   import DirectdataFlowIcon from "../../Icon/DirectdataFlowIcon.svelte";
   import DisplayFlowIcon from "../../Icon/DisplayFlowIcon.svelte";
   import DocFlowIcon from "../../Icon/DocFlowIcon.svelte";
   import InstoreFlowIcon from "../../Icon/InstoreFlowIcon.svelte";
   import IoFlowIcon from "../../Icon/IoFlowIcon.svelte";
   import LooplimitFlowIcon from "../../Icon/LooplimitFlowIcon.svelte";
   import ManualinputFlowIcon from "../../Icon/ManualinputFlowIcon.svelte";
   import ManualloopFlowIcon from "../../Icon/ManualloopFlowIcon.svelte";
   import MultidocFlowIcon from "../../Icon/MultidocFlowIcon.svelte";
   import OffpageFlowIcon from "../../Icon/OffpageFlowIcon.svelte";
   import OnpageFlowIcon from "../../Icon/OnpageFlowIcon.svelte";
   import PrepFlowIcon from "../../Icon/PrepFlowIcon.svelte";
   import PreprocessFlowIcon from "../../Icon/PreprocessFlowIcon.svelte";
   import ProcessFlowIcon from "../../Icon/ProcessFlowIcon.svelte";
   import SaveddataFlowIcon from "../../Icon/SaveddataFlowIcon.svelte";
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
      {
         title: "document",
         icon: DocFlowIcon,
      },
      {
         title: "preprocess",
         icon: PreprocessFlowIcon,
      },
      {
         title: "instore",
         icon: InstoreFlowIcon,
      },
      {
         title: "looplimit",
         icon: LooplimitFlowIcon,
      },
      {
         title: "manualloop",
         icon: ManualloopFlowIcon,
      },
      {
         title: "directdata",
         icon: DirectdataFlowIcon,
      },
      {
         title: "manualinput",
         icon: ManualinputFlowIcon,
      },
      {
         title: "multidoc",
         icon: MultidocFlowIcon,
      },
      {
         title: "prep",
         icon: PrepFlowIcon,
      },
      {
         title: "display",
         icon: DisplayFlowIcon,
      },
      {
         title: "saveddata",
         icon: SaveddataFlowIcon,
      },
      {
         title: "delay",
         icon: DelayFlowIcon,
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
   class="menu bg-base-300 absolute hidden text-sm rounded-lg grid-cols-5 gap-1"
>
   <!-- svelte-ignore a11y_consider_explicit_label -->
   {#each symbols as symbol}
      <button
         title={symbol.title}
         onclick={(e) => onclick(e, symbol.title)}
         class=" hover:bg-slate-500 bg-slate-800 cursor-pointer rounded-xs p-1 flex justify-center items-center text-gray-300"
      >
         <symbol.icon />
      </button>
   {/each}
</div>
