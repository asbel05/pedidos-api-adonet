namespace PedidosApi.Models
{
    public class DetallePedido
    {
        public long PedidoId { get; set; }
        public long ProductoId { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public decimal Descuento { get; set; }
        public decimal Subtotal { get; set; }
    }
}
