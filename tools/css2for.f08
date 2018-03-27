! Copyright (C) 2014 Denis Bernard.
! License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
! This is free software: you are free to change and redistribute it.
! There is NO WARRANTY, to the extent permitted by law.
! Written by Denis Bernard.
!
!  <----------------------------- code ---------------------------------------->-<------------------ comments --------------------->
!                                                                                ! This program is not a part of fBlog software but 
      program css2for                                                            ! a tool to generate automaticaly fortran source
!                                                                                ! code from any CSS.
!  ------------------------------ head -----------------------------------------
   use, intrinsic :: iso_fortran_env, only: iostat_end
   integer :: argc,                                                            & 
              count_lines,                                                     &
              ios,                                                             &
              u_file_in,                                                       &
              u_file_out                                    
   character(len=80)  :: arg,                                                  &
                         file_in,                                              &
                         file_out
   character(len=256) :: readline
!  ------------------------------ body -----------------------------------------
   argc = command_argument_count()
   if (argc == 0) error stop ': missing the name of the css file to convert.'
   if (argc >1) error stop ': too much arguments!'
   call get_command_argument(1, arg)
   file_in = trim(arg)
   file_out = trim(file_in) // '.f08'
   open(                                                                       &
      newunit = u_file_in,                                                     &   
      file    = trim(file_in),                                                 &
      status  = 'old'                                                          &
      )
   open(                                                                       &
      newunit  = u_file_out,                                                   &   
      file     = trim(file_out),                                               &
      position = 'append',                                                     &
      status   = 'new'                                                         &
      )
   do   
      read(                                                                    &
         unit = u_file_in,                                                     &
         fmt  = '(a)',                                                         &
         iostat = ios                                                          &
         ) readline
      count_lines = count_lines + 1 
      if(ios == iostat_end) exit
      write(                                                                   &
         unit = u_file_out,                                                    &
         fmt  = '(a)'                                                          &
         ) "'" // trim(readline) // "' // new_line('a') // &"          
      print'(a)',  "'" // trim(readline) // "' // new_line('a') // &"
   enddo
   print'(i0,2a)', count_lines - 1, ' lines written in ', trim(file_out)          
!  -----------------------------------------------------------------------------
!                                                                                ! Do not forget to remove extra sequence newline 
      end program css2for                                                        ! at the end of the last line.
!
!  <----------------------------- code ---------------------------------------->-<------------------ comments --------------------->