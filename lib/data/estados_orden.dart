const estadosOrden = ['recibida', 'en reparación', 'lista', 'entregada', 'cancelada'];

/// Transiciones permitidas desde un estado dado.
/// El flujo es lineal (recibida → en reparación → lista → entregada) sin
/// retrocesos; recibida, en reparación y lista pueden cancelarse.
/// entregada y cancelada son estados finales.
List<String> estadosSiguientes(String actual) {
  switch (actual) {
    case 'recibida':
      return ['en reparación', 'cancelada'];
    case 'en reparación':
      return ['lista', 'cancelada'];
    case 'lista':
      return ['entregada', 'cancelada'];
    default:
      return [];
  }
}
