<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://www.facturae.gob.es/formato/Versiones/Facturaev3_2_2.xml">
  <!-- Plantillas para la transformación -->
  
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Factura</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 20px;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
          }
          th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
          .totales {
            font-weight: bold;
            background-color: #f9f9f9;
          }
          .section-title {
            font-size: 1.5em;
            margin-top: 20px;
            text-decoration: underline;
          }
        </style>
      </head>
      <body>
        <h1>Factura</h1>
        
        <!-- Información de la factura -->
        <xsl:apply-templates select="ns:Facturae/ns:Factura/ns:DatosFactura"/>

        <!-- Emisor -->
        <xsl:apply-templates select="ns:Facturae/ns:Factura/ns:Emisor"/>

        <!-- Receptor -->
        <xsl:apply-templates select="ns:Facturae/ns:Factura/ns:Receptor"/>

        <!-- Detalle de los productos/servicios -->
        <xsl:apply-templates select="ns:Facturae/ns:Factura/ns:LineaFactura"/>

        <!-- Totales -->
        <xsl:apply-templates select="ns:Facturae/ns:Factura/ns:Totales"/>
      </body>
    </html>
  </xsl:template>

  <!-- Datos de la factura -->
  <xsl:template match="ns:DatosFactura">
    <div class="section-title">Datos de la Factura</div>
    <p><strong>Número de factura:</strong> <xsl:value-of select="ns:NumeroFactura"/></p>
    <p><strong>Fecha de emisión:</strong> <xsl:value-of select="ns:FechaExpedicion"/></p>
    <p><strong>Fecha de vencimiento:</strong> <xsl:value-of select="ns:FechaVencimiento"/></p>
  </xsl:template>

  <!-- Emisor -->
  <xsl:template match="ns:Emisor">
    <div class="section-title">Emisor</div>
    <p><strong>Razón Social:</strong> <xsl:value-of select="ns:RazonSocial"/></p>
    <p><strong>NIF:</strong> <xsl:value-of select="ns:NIF"/></p>
    <xsl:apply-templates select="ns:Direccion"/>
  </xsl:template>

  <!-- Receptor -->
  <xsl:template match="ns:Receptor">
    <div class="section-title">Receptor</div>
    <p><strong>Razón Social:</strong> <xsl:value-of select="ns:RazonSocial"/></p>
    <p><strong>NIF:</strong> <xsl:value-of select="ns:NIF"/></p>
    <xsl:apply-templates select="ns:Direccion"/>
  </xsl:template>

  <!-- Dirección -->
  <xsl:template match="ns:Direccion">
    <p><strong>Calle:</strong> <xsl:value-of select="ns:Calle"/></p>
    <p><strong>Ciudad:</strong> <xsl:value-of select="ns:Ciudad"/></p>
    <p><strong>Código Postal:</strong> <xsl:value-of select="ns:CodigoPostal"/></p>
    <p><strong>Provincia:</strong> <xsl:value-of select="ns:Provincia"/></p>
    <p><strong>País:</strong> <xsl:value-of select="ns:Pais"/></p>
  </xsl:template>

  <!-- Detalle de los productos/servicios -->
  <xsl:template match="ns:LineaFactura">
    <table>
      <tr>
        <th>Descripción</th>
        <th>Cantidad</th>
        <th>Precio Unitario</th>
        <th>Total</th>
        <th>IVA</th>
      </tr>
      <tr>
        <td><xsl:value-of select="ns:Descripcion"/></td>
        <td><xsl:value-of select="ns:Cantidad"/></td>
        <td><xsl:value-of select="ns:PrecioUnitario"/></td>
        <td><xsl:value-of select="ns:Total"/></td>
        <td><xsl:value-of select="ns:IVA"/>%</td>
      </tr>
    </table>
  </xsl:template>

  <!-- Totales -->
  <xsl:template match="ns:Totales">
    <div class="section-title">Totales</div>
    <p><strong>Base Imponible:</strong> <xsl:value-of select="ns:BaseImponible"/></p>
    <p><strong>IVA:</strong> <xsl:value-of select="ns:IVA"/></p>
    <p class="totales"><strong>Total de la factura:</strong> <xsl:value-of select="ns:TotalFactura"/></p>
  </xsl:template>

</xsl:stylesheet>
