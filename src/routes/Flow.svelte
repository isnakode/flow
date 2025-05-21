<script lang="ts">
   import type { Node } from "@xyflow/svelte";
   import {
      Background,
      ConnectionMode,
      SvelteFlow,
      useOnSelectionChange,
      useSvelteFlow,
   } from "@xyflow/svelte";
   import "@xyflow/svelte/dist/style.css";
   import BranchSymbol from "./BranchSymbol.svelte";
   import ProcessSymbol from "./ProcessSymbol.svelte";
   import StartSymbol from "./StartSymbol.svelte";

   const { screenToFlowPosition } = useSvelteFlow();

   let selectedNodes = $state.raw<string[]>([]);
   let selectedEdges = $state.raw<string[]>([]);

   useOnSelectionChange(({ nodes, edges }) => {
      selectedNodes = nodes.map((node) => node.id);
      selectedEdges = edges.map((edge) => edge.id);
   });

   let paneContextMenu: HTMLDivElement;
   let nodeContextMenu: HTMLUListElement;
   let nodes: Node[] = $state.raw([]);

   const showPaneMenu = (e: MouseEvent) => {
      e.preventDefault();
      paneContextMenu.style.top = `${e.pageY}px`;
      paneContextMenu.style.left = `${e.pageX}px`;
      paneContextMenu.style.display = "grid";
   };
   const showNodeMenu = (e: MouseEvent) => {
      e.preventDefault();
      nodeContextMenu.style.top = `${e.pageY}px`;
      nodeContextMenu.style.left = `${e.pageX}px`;
      nodeContextMenu.style.display = "block";
   };

   const addNode = (e: MouseEvent, type: "process" | "start" | "branch") => {
      const position = screenToFlowPosition({
         x: e.clientX,
         y: e.clientY,
      });
      nodes = [
         ...nodes,
         {
            id:
               nodes.length == 0
                  ? "0"
                  : `${Math.max(...nodes.map((node) => parseInt(node.id) || 0)) + 1}`,
            position,
            data: { title: type },
            type,
         },
      ];
   };
</script>

<svelte:document
   onclick={() => {
      paneContextMenu.style.display = "none";
      nodeContextMenu.style.display = "none";
   }}
   on:keyup={(e) => {
      if (e.key == "Delete") {
         nodes = nodes.filter((node) => {
            return !selectedNodes.includes(node.id);
         });
      }
   }}
/>

<div class="w-full h-dvh overflow-hidden">
   <SvelteFlow
      connectionMode={ConnectionMode.Loose}
      panOnDrag={false}
      panOnScroll
      onpanecontextmenu={(e) => showPaneMenu(e.event)}
      onnodecontextmenu={(e) => showNodeMenu(e.event)}
      bind:nodes
      defaultEdgeOptions={{ type: "smoothstep" }}
      nodeTypes={{
         process: ProcessSymbol,
         start: StartSymbol,
         branch: BranchSymbol,
      }}
      panActivationKey="Shift"
   >
      <Background bgColor="#303030" patternColor="#525252" />
   </SvelteFlow>

   <div
      bind:this={paneContextMenu}
      class="menu bg-base-200 absolute hidden text-sm rounded-box grid-cols-5"
   >
      <!-- svelte-ignore a11y_consider_explicit_label -->
      <button
         onclick={(e) => {
            addNode(e, "process");
         }}
         class=" hover:bg-gray-600 rounded-lg p-1 flex justify-center items-center"
      >
         <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="size-5"
            ><rect width="20" height="12" x="2" y="6" rx="2" /></svg
         >
      </button>
      <!-- svelte-ignore a11y_consider_explicit_label -->
      <button
         onclick={(e) => {
            addNode(e, "branch");
         }}
         class=" hover:bg-gray-600 rounded-lg p-1 flex justify-center items-center"
      >
         <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="size-5"
            ><path
               d="M2.7 10.3a2.41 2.41 0 0 0 0 3.41l7.59 7.59a2.41 2.41 0 0 0 3.41 0l7.59-7.59a2.41 2.41 0 0 0 0-3.41l-7.59-7.59a2.41 2.41 0 0 0-3.41 0Z"
            /></svg
         >
      </button>

      <!-- svelte-ignore a11y_consider_explicit_label -->
      <button
         onclick={(e) => {
            addNode(e, "start");
         }}
         class=" hover:bg-gray-600 rounded-lg p-1 flex justify-center items-center"
      >
         <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="size-5"><circle cx="12" cy="12" r="10" /></svg
         >
      </button>
      <!-- svelte-ignore a11y_consider_explicit_label -->
      <button
         onclick={() => {}}
         class=" hover:bg-gray-600 rounded-lg p-1 flex justify-center items-center"
      >
         <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="size-5"
            ><ellipse cx="12" cy="5" rx="9" ry="3" /><path
               d="M3 5v14a9 3 0 0 0 18 0V5"
            /></svg
         >
      </button>
      <!-- svelte-ignore a11y_consider_explicit_label -->
      <button
         onclick={(e) => {
            addNode(e, "process");
         }}
         class=" hover:bg-gray-600 rounded-lg p-1 flex justify-center items-center"
      >
         <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="size-5 rotate-90"
            ><path
               d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"
            /></svg
         >
      </button>
   </div>

   <ul
      bind:this={nodeContextMenu}
      class="menu bg-base-200 absolute hidden text-sm rounded-box w-56"
   >
      <!-- <li>
         <button onclick={(e) => addNode(e, "action")}>
            <ActionIcon />
            Action
         </button>
      </li>
      <li>
         <button onclick={(e) => addNode(e, "if")}>
            <IfIcon />
            Loop
         </button>
      </li> -->
   </ul>

   <aside
      class="fixed top-0 right-0 bg-zinc-900 border-l-2 text-gray-300 transition-all border-[#303030] p-4 min-w-72 h-dvh"
   >
      {#if selectedNodes.length == 1}
         {@const node = nodes.find((n) => n.id == selectedNodes[0])!}
         <label for="title" class="mb-2 block">
            <p class="text-xs">Title <span class="text-amber-500">*</span></p>
            <input
               id="title"
               type="text"
               class="input input-sm bg-zinc-700"
               value={node.data.title}
            />
         </label>
         <label for="Action">
            <p class="text-xs">Action <span class="text-amber-500">*</span></p>
            <input id="Action" type="text" class="input input-sm bg-zinc-700" />
         </label>
      {/if}
   </aside>
</div>
