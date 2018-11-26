      subroutine gmuini

cc        use f2_grid
      implicit none

*****************************************************************
*                                                               *
*   Sets all the default parameters for the events generator    *
*                                                               *
*****************************************************************
      real pi
      parameter(pi=3.141592654)

      integer iend,ndim,npoin,nprin,ntreat,itmx,ncvg,ilepton,proc
      integer ngen,iread

c        real*8, allocatable, dimension(:,:)::fmap_F2
c        real*8, allocatable, dimension(:,:)::fmap_FL

      double precision inp1,inp2
      double precision q1t_min,q1t_max,q2t_min,q2t_max
      double precision ptdiff_min,ptdiff_max
      double precision pt_min,pt_max
      double precision y_min,y_max
      double precision amx_min,amx_max,amy_min,amy_max
      
      double precision am_p,am_pi

      double precision xdummy,q2dummy,F2dummy,FLdummy

      double precision fmap_mstw_F2
      double precision fmap_mstw_FL

c      double precision fmap_F2(120,120)
c      double precision fmap_FL(120,120)


      common/vggen/iend,ndim,npoin,nprin,ntreat,itmx,ncvg
      common/cuts/inp1,inp2,
     +     ptdiff_min,ptdiff_max,
     +     y_min,y_max,
     +     pt_min,pt_max,
     +     q1t_min,q1t_max,q2t_min,q2t_max,
     +     amx_min,amx_max,amy_min,amy_max
      common/settings/ilepton,proc,ngen

      common/transfer1/fmap_mstw_F2(120,120),
     2                fmap_mstw_FL(120,120)

c        use f2_grid


      print *,'********************************************************'
      print *,'*    PPPPPP  PPPPPP  TTTTTTT  OOOOO  LL      LL        *'
      print *,'*    PP   PP PP   PP   TTT   OO   OO LL      LL        *'
      print *,'*    PPPPPP  PPPPPP    TTT   OO   OO LL      LL        *'
      print *,'*    PP      PP        TTT   OO   OO LL      LL        *'
      print *,'*    PP      PP        TTT    OOOO0  LLLLLLL LLLLLLL   *'
      print *,'********************************************************'
      print *,'* An exclusive and semi-exclusive pp -> p(*) l+l- p(*) *'
      print *,'* events generator for LHC energies                    *'
      print *,'*                                                      *'
      print *,'* (c) 2014-2015 Louvain-la-Neuve-Krakow collaboration  *'
      print *,'*    Gustavo.Dasilveira@uclouvain.be                   *'
      print *,'*    Laurent.Forthomme@uclouvain.be                    *'
      print *,'*    Krzysztof.Piotrzkowski@uclouvain.be               *'
      print *,'*    Marta.Luszczak@ur.edu.pl               *'
      print *,'*    Wolfgang.Schafer@ifj.edu.pl                       *'
      print *,'*    Antoni.Szczurek@ifj.edu.pl                        *'
      print *,'********************************************************'

*
*  First we define some constants
      am_p = 0.93827203         ! proton mass
      am_pi = 0.1349766         ! pi0 mass
*
*  Stop point of the events generator (3 = whole run)
      iend   = 3
*
*  Number of calls per Vegas iteration
      ncvg   = 10000
*
*  Number of Vegas iterations
      itmx   = 10
*
*  Number of call per bin in SETGEN (nr. of bins is 3**8=6561 or 3**7=2187)
      npoin  = 100
*
*  Vegas print flag and strategy number
      nprin  = 0
      ntreat = 1
*
*  Number of events to generate
      ngen = 100000
*
*  Phase space parameters
      inp1 = 3.5d3
      inp2 = 3.5d3
      q1t_min = 0.d0
      q1t_max = 30.d0
      q2t_min = 0.d0
c      q2t_max = 50.d0
      q2t_max = 30.d0
c     Changed for elastic
c     q2t_max = 5.d0            ! 5.0d0 or 50.d0
c     
      y_min = -2.5d0
      y_max = 2.5d0
      ptdiff_min = 0.d0
      ptdiff_max = 2000.d0
cc      ptdiff_max = 200.d0

      pt_min = 15.d0
      pt_max = 50.d0
      
      amx_min = am_p + am_pi
      amx_max = 100.d0

      amy_min = am_p + am_pi
      amy_max = 100.d0

      proc = 1
*
*  Leptons family for the outgoing particles (1 = electron, 2 = muon, 3 = tau)
      ilepton = 2

c   initialize grid for MSTW

      iread=0

      xdummy = 0.01d0
      q2dummy = 20.d0

      write(*,*) "Reading grids for F2"
      call F2_inter_MSTW(xdummy,q2dummy,iread,F2dummy,FLdummy)
c      call READ_GRID(fmap_F2,fmap_FL)

      return      
        end
