# require "rqrcode"
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def qr_code_generator
    qrcode = RQRCode::QRCode.new("http://github.com/")

    # NOTE: showing with default options specified explicitly
    @svg_qrcode = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
#     qrcode = RQRCode::QRCode.new("http://github.com/")

# # NOTE: showing with default options specified explicitly
#     @png = qrcode.as_png(
#       bit_depth: 1,
#       border_modules: 4,
#       color_mode: ChunkyPNG::COLOR_GRAYSCALE,
#       color: "black",
#       file: nil,
#       fill: "white",
#       module_px_size: 6,
#       resize_exactly_to: false,
#       resize_gte_to: false,
#       size: 120
#     )
  end
end
