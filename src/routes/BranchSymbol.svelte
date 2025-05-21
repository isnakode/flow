<script lang="ts">
    import { Handle, Position, type NodeProps } from "@xyflow/svelte";
    let actionChoice = $state("makedir");

    const { data, id, selected }: NodeProps = $props();
</script>

<div>
    <button
        class="text-sm min-h-24 min-w-24 rotate-45 scale-75 flex justify-center items-center bg-zinc-900 ring-2 {selected
            ? 'ring-emerald-700'
            : 'ring-transparent hover:ring-zinc-600'} p-4 text-gray-300 transition-all"
    >
        <span class="-rotate-45">{"2 > 3"}</span>
    </button>
    <Handle
        id="branch-a"
        type="source"
        position={Position.Top}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="branch-b"
        type="source"
        position={Position.Bottom}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="branch-c"
        type="source"
        position={Position.Left}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
    <Handle
        id="branch-d"
        type="source"
        position={Position.Right}
        class="bg-gray-400! size-2! border-none! rounded-full!"
    />
</div>
