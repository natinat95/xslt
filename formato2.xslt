<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.facturae.gob.es/formato/Versiones/Facturaev3_2_2.xml">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Factura</title>
        <style>
          body {
            font-family: 'Poppins', sans-serif;
            margin: 40px;
            background-color: #f8f9fa;
            color: #343a40;
          }
          h1 {
            text-align: center;
            font-size: 2.5em;
            color: #d32f2f;
          }
          .factura-container {
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 800px;
            margin: auto;
          }
          .section-title {
            font-size: 1.3em;
            color: #d32f2f;
            margin-bottom: 15px;
            font-weight: bold;
          }
          .factura-details, .address {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
          }
          .factura-details div, .address div {
            flex: 1;
          }
          .factura-details p, .address p {
            font-size: 1em;
            margin: 5px 0;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
          }
          table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
          }
          table th {
            background-color: #f1f1f1;
            color: #333;
          }
          .totales {
            margin-top: 20px;
            font-size: 1.1em;
            font-weight: bold;
            text-align: right;
          }
          .totales p {
            margin: 5px 0;
          }
          .totales .total {
            color: #d32f2f;
            font-size: 1.3em;
          }
        </style>
      </head>
      <body>
        <h1>Factura</h1>
        <div class="factura-container">
          
          <!-- Información de la factura -->
          <div class="factura-details">
            <div>
              <p><strong>Número:</strong> <xsl:value-of select="//ns:NumeroFactura"/></p>
              <p><strong>Fecha:</strong> <xsl:value-of select="//ns:FechaExpedicion"/></p>
              <p><strong>Vencimiento:</strong> <xsl:value-of select="//ns:FechaVencimiento"/></p>
            </div>
            <div>
              <p><strong>Emisor:</strong> <xsl:value-of select="//ns:Emisor/ns:RazonSocial"/></p>
              <p><strong>NIF:</strong> <xsl:value-of select="//ns:Emisor/ns:NIF"/></p>
            </div>
          </div>

          <!-- Dirección del Emisor -->
          <div class="address">
            <div>
              <h3 class="section-title">Dirección del Emisor</h3>
              <p><strong>Calle:</strong> <xsl:value-of select="//ns:Emisor/ns:Direccion/ns:Calle"/></p>
              <p><strong>Ciudad:</strong> <xsl:value-of select="//ns:Emisor/ns:Direccion/ns:Ciudad"/></p>
              <p><strong>Código Postal:</strong> <xsl:value-of select="//ns:Emisor/ns:Direccion/ns:CodigoPostal"/></p>
              <p><strong>Provincia:</strong> <xsl:value-of select="//ns:Emisor/ns:Direccion/ns:Provincia"/></p>
              <p><strong>País:</strong> <xsl:value-of select="//ns:Emisor/ns:Direccion/ns:Pais"/></p>
            </div>
          </div>

          <!-- Detalle de productos/servicios -->
          <h3 class="section-title">Detalle de Productos/Servicios</h3>
          <table>
            <tr>
              <th>Descripción</th>
              <th>Cantidad</th>
              <th>Precio Unitario</th>
              <th>IVA</th>
              <th>Total</th>
            </tr>
            <xsl:for-each select="//ns:LineaFactura">
              <tr>
                <td><xsl:value-of select="ns:Descripcion"/></td>
                <td><xsl:value-of select="ns:Cantidad"/></td>
                <td><xsl:value-of select="ns:PrecioUnitario"/>€</td>
                <td><xsl:value-of select="ns:IVA"/>%</td>
                <td><xsl:value-of select="ns:Total"/>€</td>
              </tr>
            </xsl:for-each>
          </table>

          <!-- Totales -->
          <div class="totales">
            <p><strong>Base Imponible:</strong> <xsl:value-of select="//ns:BaseImponible"/>€</p>
            <p><strong>IVA:</strong> <xsl:value-of select="//ns:IVA"/>€</p>
            <p class="total"><strong>Total:</strong> <xsl:value-of select="//ns:TotalFactura"/>€</p>
          </div>

        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
