<script lang="ts">
   import FlowchartNode from "$lib/components/FlowchartNode.svelte";
   import MyEdge from "$lib/components/MyEdge.svelte";
   import SymbolContextMenu from "$lib/components/SymbolContextMenu.svelte";
   import type { SymbolData } from "$lib/SymbolData";
   import type { Edge, Node } from "@xyflow/svelte";
   import {
      Background,
      ConnectionMode,
      SvelteFlow,
      useOnSelectionChange,
      useSvelteFlow,
   } from "@xyflow/svelte";
   import "@xyflow/svelte/dist/style.css";

   const { screenToFlowPosition, updateNodeData, updateEdge } = useSvelteFlow();

   let selectedNodes = $state.raw<string[]>([]);
   let selectedEdges = $state.raw<string[]>([]);

   useOnSelectionChange(({ nodes, edges }) => {
      selectedNodes = nodes.map((node) => node.id);
      selectedEdges = edges.map((edge) => edge.id);
   });

   // svelte-ignore non_reactive_update
   let paneContextMenu: HTMLDivElement;
   let nodeContextMenu: HTMLUListElement;
   let nodes: Node<SymbolData>[] = $state.raw([]);
   let edges: Edge[] = $state.raw([]);

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

   const addFlowchartNode = (e: MouseEvent, type: string) => {
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
            data: { background: "#191E24", labelSize: 14, type },
            type: "flowchart",
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
         selectedNodes = [];
         edges = edges.filter((edge) => {
            return !selectedEdges.includes(edge.id);
         });
         selectedEdges = [];
      }
   }}
/>

<div class="w-full h-dvh overflow-hidden">
   <SvelteFlow
      snapGrid={[5, 5]}
      disableKeyboardA11y
      connectionMode={ConnectionMode.Loose}
      onpanecontextmenu={(e) => showPaneMenu(e.event)}
      onnodecontextmenu={(e) => showNodeMenu(e.event)}
      bind:nodes
      bind:edges
      defaultEdgeOptions={{ type: "los" }}
      edgeTypes={{
         los: MyEdge,
      }}
      nodeTypes={{
         flowchart: FlowchartNode,
      }}
   >
      <Background bgColor="#303030" patternColor="#525252" />
   </SvelteFlow>
   <SymbolContextMenu bind:paneContextMenu onclick={addFlowchartNode} />
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
         <label for="text" class="mb-2 block">
            <p class="text-xs">text <span class="text-amber-500">*</span></p>
            <textarea
               id="text"
               class="textarea outline-none! border-none! bg-zinc-700"
               oninput={(e) => {
                  updateNodeData(node.id, { label: e.currentTarget.value });
               }}>{node.data.label}</textarea
            >
         </label>
         <label for="font-size" class="mb-2 block">
            <p class="text-xs">
               Font size <span class="text-amber-500">*</span>
            </p>
            <input
               id="font-size"
               type="number"
               class="input outline-none! border-none! bg-zinc-700"
               value={node.data.labelSize}
               oninput={(e) => {
                  let labelSize = parseInt(e.currentTarget.value);
                  if (
                     Number.isInteger(labelSize) &&
                     labelSize >= 16 &&
                     labelSize <= 30
                  ) {
                     updateNodeData(node.id, { labelSize });
                  }
               }}
            />
         </label>
         <label for="bg-color" class="mb-2 block">
            <p class="text-xs">
               Background color <span class="text-amber-500">*</span>
            </p>
            <input
               id="bg-color"
               type="color"
               class="input outline-none! border-none! bg-zinc-700 cursor-pointer"
               value={node.data.background}
               oninput={(e) => {
                  updateNodeData(node.id, {
                     background: e.currentTarget.value,
                  });
               }}
            />
         </label>
      {/if}
      {#if selectedEdges.length == 1}
         {@const edge = edges.find((n) => n.id == selectedEdges[0])!}
         <label for="text" class="mb-2 block">
            <p class="text-xs">text <span class="text-amber-500">*</span></p>
            <input
               id="text"
               type="text"
               class="input input-sm bg-zinc-700"
               value={edge.data?.label}
               oninput={(e) => {
                  updateNodeData(edge.id, { label: e.currentTarget.value });
               }}
            />
         </label>
         <label for="font-size" class="mb-2 block">
            <p class="text-xs">
               Font size <span class="text-amber-500">*</span>
            </p>
            <input
               id="font-size"
               type="number"
               class="input input-sm bg-zinc-700"
               value={edge.data?.labelSize}
               oninput={(e) => {
                  let labelSize = parseInt(e.currentTarget.value);
                  if (labelSize < 16 || Number.isNaN(labelSize)) {
                     labelSize = 16;
                  }
               }}
            />
         </label>
         <label for="bg-color" class="mb-2 block">
            <p class="text-xs">
               Background color <span class="text-amber-500">*</span>
            </p>
            <input
               id="bg-color"
               type="color"
               class="input input-sm bg-zinc-700 cursor-pointer"
               value={edge.data?.background}
               oninput={(e) => {}}
            />
         </label>
      {/if}
   </aside>
</div>
