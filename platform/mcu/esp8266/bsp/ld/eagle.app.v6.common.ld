/* This linker script generated from xt-genldscripts.tpp for LSP . */
/* Linker Script for ld -N */

PHDRS
{
  dport0_0_phdr PT_LOAD;
  dram0_0_phdr PT_LOAD;
  dram0_0_bss_phdr PT_LOAD;
  iram1_0_phdr PT_LOAD;
  irom0_0_phdr PT_LOAD;
}

/*  Default entry point:  */
ENTRY(call_user_start)
EXTERN(_DebugExceptionVector)
EXTERN(_DoubleExceptionVector)
EXTERN(_KernelExceptionVector)
EXTERN(_NMIExceptionVector)
EXTERN(_UserExceptionVector)
PROVIDE(_memmap_vecbase_reset = 0x40000000);
/* Various memory-map dependent cache attribute settings: */
_memmap_cacheattr_wb_base = 0x00000110;
_memmap_cacheattr_wt_base = 0x00000110;
_memmap_cacheattr_bp_base = 0x00000220;
_memmap_cacheattr_unused_mask = 0xFFFFF00F;
_memmap_cacheattr_wb_trapnull = 0x2222211F;
_memmap_cacheattr_wba_trapnull = 0x2222211F;
_memmap_cacheattr_wbna_trapnull = 0x2222211F;
_memmap_cacheattr_wt_trapnull = 0x2222211F;
_memmap_cacheattr_bp_trapnull = 0x2222222F;
_memmap_cacheattr_wb_strict = 0xFFFFF11F;
_memmap_cacheattr_wt_strict = 0xFFFFF11F;
_memmap_cacheattr_bp_strict = 0xFFFFF22F;
_memmap_cacheattr_wb_allvalid = 0x22222112;
_memmap_cacheattr_wt_allvalid = 0x22222112;
_memmap_cacheattr_bp_allvalid = 0x22222222;
PROVIDE(_memmap_cacheattr_reset = _memmap_cacheattr_wb_trapnull);

/* recovery */
_rec_text_start = ORIGIN(irom0_0_seg);
_rec_text_end   = ORIGIN(irom0_0_seg) + 0x4000;
_rec_data_end   = _rec_text_end + 0xC00;
_begin_of_ram   = ORIGIN(dram0_0_seg);
_end_of_ram     = ORIGIN(dram0_0_seg) + LENGTH(dram0_0_seg);
_SYS_STACK_SIZE_ = 0x800;

SECTIONS
{
  .dport0.rodata : ALIGN(4)
  {
    _dport0_rodata_start = ABSOLUTE(.);
    *(.dport0.rodata)
    *(.dport.rodata)
    _dport0_rodata_end = ABSOLUTE(.);
  } >dport0_0_seg :dport0_0_phdr

  .dport0.literal : ALIGN(4)
  {
    _dport0_literal_start = ABSOLUTE(.);
    *(.dport0.literal)
    *(.dport.literal)
    _dport0_literal_end = ABSOLUTE(.);
  } >dport0_0_seg :dport0_0_phdr

  .dport0.data : ALIGN(4)
  {
    _dport0_data_start = ABSOLUTE(.);
    *(.dport0.data)
    *(.dport.data)
    _dport0_data_end = ABSOLUTE(.);
  } >dport0_0_seg :dport0_0_phdr

  .text : ALIGN(4)
  {
    _stext = .;
    _text_start = ABSOLUTE(.);
    *(.UserEnter.text)
    . = ALIGN(16);
    *(.DebugExceptionVector.text)
    . = ALIGN(16);
    *(.NMIExceptionVector.text)
    . = ALIGN(16);
    *(.KernelExceptionVector.text)
    LONG(0)
    LONG(0)
    LONG(0)
    LONG(0)
    . = ALIGN(16);
    *(.UserExceptionVector.text)
    LONG(0)
    LONG(0)
    LONG(0)
    LONG(0)
    . = ALIGN(16);
    *(.DoubleExceptionVector.text)
    LONG(0)
    LONG(0)
    LONG(0)
    LONG(0)
    . = ALIGN (16);
    *(.entry.text)
    *(.init.literal)
    *(.init)
    *esp8266.a:entry.o(.literal .text .literal.* .text.*)
    *libmain.a:spi_flash.o(.literal .text .literal.* .text.*)
    *xtensa.a:xtensa_vectors.o(.literal .text .literal.* .text.*)
    *xtensa.a:port.o(.literal .text .literal.* .text.*)
    *(.literal .text)
    _text_end = ABSOLUTE(.);
    _etext = .;
  } >iram1_0_seg :iram1_0_phdr

  .irom0.text : ALIGN(4)
  {
    _irom0_text_start = ABSOLUTE(.);
	*(.rodata)
    *(.rodata.*)
    *(.irom0.literal .irom.literal .irom.text.literal .irom0.text .irom.text)
    *(.literal.* .text.*)
    _irom0_text_end = ABSOLUTE(.);
  } >irom0_0_seg :irom0_0_phdr

  .data : ALIGN(4)
  {
    _data_start = ABSOLUTE(.);
    *(.data)
    *(.data.*)
    _data_end = ABSOLUTE(.);
  } >dram0_0_seg :dram0_0_phdr

  .rodata : ALIGN(4)
  {
    _rodata_start = ABSOLUTE(.);
    __init_array_start = ABSOLUTE(.);
    __init_array_end = ABSOLUTE(.);
    _bss_table_start = ABSOLUTE(.);
    LONG(_bss_start)
    LONG(_bss_end)
    _bss_table_end = ABSOLUTE(.);
    _rodata_end = ABSOLUTE(.);
  } >dram0_0_seg :dram0_0_phdr

  .UserExceptionVector.literal : AT(LOADADDR(.rodata) + (ADDR(.UserExceptionVector.literal) - ADDR(.rodata))) ALIGN(4)
  {
    _UserExceptionVector_literal_start = ABSOLUTE(.);
    *(.UserExceptionVector.literal)
    _UserExceptionVector_literal_end = ABSOLUTE(.);
  } >dram0_0_seg :dram0_0_phdr

  .bss ALIGN(8) (NOLOAD) : ALIGN(4)
  {
    . = ALIGN (8);
    _bss_start = ABSOLUTE(.);
    *recovery.a:(.bss .bss.* COMMON)
    *nbpatch.a:(.bss .bss.* COMMON)
    *xz-embedded.a:(.bss .bss.* COMMON)
    *esp8266.a:rec_sys.o(.bss .bss.* COMMON)
    *esp8266.a:rec_flash.o(.bss .bss.* COMMON)
    *esp8266.a:rec_uart.o(.bss .bss.* COMMON)
    *esp8266.a:heap_iram.o(.bss .bss.* COMMON)
    *esp8266.a:entry.o(.bss .bss.* COMMON)
    *libmain.a:spi_flash.o(.bss .bss.* COMMON)
    *libgcc.a:(.bss .bss.* COMMON)
    *libespos.a:(.bss .bss.* COMMON)
    *libmain.a:(.bss .bss.* COMMON)
    *xtensa.a:(.bss .bss.* COMMON)
    *libhal.a:(.bss .bss.* COMMON)
    *libnet80211.a:(.bss .bss.* COMMON)
    *esp8266.a:(.bss .bss.* COMMON)
    PROVIDE(_rec_heap_start =  ALIGN (8));
    *libcirom.a:(.bss .bss.* COMMON)
    *libcrypto.a:(.bss .bss.* COMMON)
    *libwpa.a:(.bss .bss.* COMMON)
    *liblwip.a:(.bss .bss.* COMMON)
    *libphy.a:(.bss .bss.* COMMON)
    *libpp.a:(.bss .bss.* COMMON)
    *rhino.a:(.bss .bss.* COMMON)
    *(.bss)
    *(.bss.*)
    *(COMMON)
    . = ALIGN (8);
    _bss_end = ABSOLUTE(.);
    _heap_start = ABSOLUTE(.);
  } >dram0_0_seg :dram0_0_bss_phdr

  PROVIDE(_rec_heap_end = _end_of_ram - 2*_SYS_STACK_SIZE_);
  PROVIDE(_rec_heap_len = _end_of_ram - 2*_SYS_STACK_SIZE_ - _rec_heap_start);

  PROVIDE(_rec_main_stack_start = _end_of_ram - 2*_SYS_STACK_SIZE_);
  PROVIDE(_rec_main_stack_end = _end_of_ram);
  PROVIDE(_rec_main_stack_len = 2*_SYS_STACK_SIZE_);

  .lit4 : ALIGN(4)
  {
    _lit4_start = ABSOLUTE(.);
    *(*.lit4)
    *(.lit4.*)
    *(.gnu.linkonce.lit4.*)
    _lit4_end = ABSOLUTE(.);
  } >iram1_0_seg :iram1_0_phdr
}

/* get ROM code address */
INCLUDE "../ld/eagle.rom.addr.v6.ld"
