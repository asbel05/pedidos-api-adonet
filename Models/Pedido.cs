namespace PedidosApi.Models
{
    public class Pedido
    {
        public long PedidoId { get; set; }
        public long ClienteId { get; set; }
        public string NombreCliente { get; set; } = string.Empty;
        public DateTime Fecha { get; set; }
        public decimal Total { get; set; }
        public List<DetallePedido> Detalles { get; set; } = [];
    }
}
