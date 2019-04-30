
create trigger deneme on Malkabul
for insert
as
begin

declare  
	    @MaliyetKS float, @TeslimatKS float, @KaliteKS float, @MemnuniyetKS float

		select @MaliyetKS = isnull((select FloatDeger from Ayarlar where Anahtar ='MaliyetKS' ),0.5)
		select @KaliteKS = isnull((select FloatDeger from Ayarlar where Anahtar ='KaliteKS' ),0.5)
		select @TeslimatKS = isnull((select FloatDeger from Ayarlar where Anahtar ='TeslimatKS' ),0.5)
		select @MemnuniyetKS = isnull((select FloatDeger from Ayarlar where Anahtar ='MemnuniyetKS' ),0.5)
		  
		 
	    create table #TempGruplaStokKodTed([StokKodu] varchar(10), [TedarikciId] int , [MaliyetPuan] smallint , [KalitePuan] smallint, 
			 								[TeslimatPuan] smallint, [MemnuniyetPuan] smallint, [Adet] int) 
		 --drop table #TempGruplaStokKodTed
		
		
    insert into #TempGruplaStokKodTed( [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan],[Adet] ) 
	select [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Adet] 
	   from inserted  	
	   	  
	  
	update #TempGruplaStokKodTed set MaliyetPuan = (MaliyetPuan * 0.8)+10,	
								     KalitePuan = (KalitePuan * 0.8)+10,
								     TeslimatPuan = (TeslimatPuan * 0.8)+10,
								     MemnuniyetPuan = (MemnuniyetPuan * 0.8)+10

--select * from #TempGruplaStokKodTed
   
   --select distinct StokKodu into #temp from #TempGruplaStokKodTed  
  --  select * from #Temp 
--	 --return

--Deðiþkenlerin tanýmlanmasý iþlemi
DECLARE 
 	@StokKodu varchar(10), @TedId int ,@MaliyetPuan smallint , @KalitePuan smallint, 
 	@TeslimatPuan smallint, @MemnuniyetPuan smallint,@Adet int

--En dýþtaki cursor'un tanýmlanmasý iþlemi
DECLARE CursorStokKodu CURSOR
FOR
     select distinct StokKodu   
	 from #TempGruplaStokKodTed  
	  
--Cursor'un açýlmasý iþlemi (En dýþtaki)
OPEN CursorStokKodu
--Cursor ile satýr satýr CursorStokKodu içinde gezinip stokkodu deðerlerinin alýnmasý
FETCH NEXT FROM CursorStokKodu INTO @StokKodu
--Döngü baþlýyor
WHILE @@FETCH_STATUS = 0
 BEGIN
	   --Ýçteki cursor'un tanýmlanmasý iþlemi
        DECLARE CursorTedId CURSOR FOR
		    --Cursor ile sotokkodu deðerinin dýþtaki sorgudan alýnýp içeride dönülmesi iþlemi
            SELECT  TedarikciId,MaliyetPuan,KalitePuan, TeslimatPuan, MemnuniyetPuan, Adet
            FROM  #TempGruplaStokKodTed
            WHERE   StokKodu = @StokKodu

         --Cursor'un açýlmasý iþlemi (Ýçteki)
        OPEN CursorTedId
		--Burada cursor içeride stokkoda göre dönüp tedidyi alýyor.
        FETCH NEXT FROM CursorTedId INTO @TedId,@MaliyetPuan , @KalitePuan , @TeslimatPuan , @MemnuniyetPuan ,@Adet
		--Döngü baþlýyor
     WHILE @@FETCH_STATUS = 0
         BEGIN

			--yaþ alg burda yapýlcak

			if(exists(select * from UrunTedarikci where StokKodu =@StokKodu and TedarikciId = @TedId))
			begin
				declare @Ortid int, @OrtMaliyet smallint , @OrtKalite smallint, @OrtTeslimat smallint ,@OrtMaliyetAgirlik float,
						@OrtKaliteAgirlik float ,@OrtTeslimatAgirlik float, @OrtAdetE float
				
				select @Ortid=id, @OrtMaliyet =MaliyetPuan, @OrtKalite=KalitePuan, @OrtTeslimat=TeslimatPuan ,
						@OrtMaliyetAgirlik= MaliyetAgirlik ,@OrtKaliteAgirlik=KaliteAgirlik , @OrtTeslimatAgirlik= KaliteAgirlik
					from UrunTedarikci where StokKodu =@StokKodu and TedarikciId = @TedId	

					set @OrtAdetE = @OrtMaliyetAgirlik 
					set @OrtMaliyetAgirlik = @OrtAdetE * @MaliyetKS +1
			   		set @OrtMaliyet = (@OrtMaliyet * @OrtMaliyetAgirlik * @MaliyetKS + @MaliyetPuan)/(@OrtMaliyetAgirlik)

					
					set @OrtAdetE = @OrtKaliteAgirlik 
					set @OrtKaliteAgirlik = @OrtAdetE * @KaliteKS +1
			   		set @OrtKalite = (@OrtKalite * @OrtKaliteAgirlik * @KaliteKS + @KalitePuan)/(@OrtKaliteAgirlik)
					
					set @OrtAdetE = @OrtTeslimatAgirlik 
					set @OrtTeslimatAgirlik = @OrtAdetE * @TeslimatKS +1
			   		set @OrtTeslimat = (@OrtTeslimat * @OrtTeslimatAgirlik * @TeslimatKS + @TeslimatPuan)/(@OrtTeslimatAgirlik)

					update UrunTedarikci set MaliyetPuan=@OrtMaliyet  , KalitePuan= @OrtKalite , TeslimatPuan= @OrtTeslimat ,MaliyetAgirlik= @OrtMaliyetAgirlik ,
											KaliteAgirlik= @OrtKaliteAgirlik  ,TeslimatAgirlik= @OrtTeslimatAgirlik 
							  where id=@Ortid

			end
			else
			begin
				insert UrunTedarikci ( [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik] )
				        values(@StokKodu, @TedId,@MaliyetPuan ,1, @KalitePuan ,1, @TeslimatPuan ,1)

			end
				
			-- bu satýrdan aþþasý tedarikci tablosuna ( tedid2 ler tedarikci tablosundaki id alaný o satýra update çekmek için aþþada kullanýcaz) 
				declare @TedId2 int, @TedMemnuniyet smallint ,@TedMemnuniyetAgirlik float,@TedAdetE float
				
				select @TedId2=id, @TedMemnuniyet =Memnuniyet, @TedMemnuniyetAgirlik=MemnuniyetAgirlik--tabloda onceden olan kayýtlarý aldýk
					from Tedarikci where id = @TedId	
				
				 set @TedAdetE = @TedMemnuniyetAgirlik  --aldýmýz kayýtlara yaþlandýrma alg uyguladýk
				 set @TedMemnuniyetAgirlik = @TedAdetE * @MemnuniyetKS +1
			     set @TedMemnuniyet = (@TedMemnuniyet * @TedMemnuniyetAgirlik * @MemnuniyetKS + @MemnuniyetPuan)/(@TedMemnuniyetAgirlik)

				 update Tedarikci set Memnuniyet=@TedMemnuniyet  , MemnuniyetAgirlik= @TedMemnuniyetAgirlik -- hesaplanmýþ verileri update çektik
				   where id=@TedId2
				-- tedid2 ler tedarikci tablosu	   

                FETCH NEXT FROM CursorTedId INTO @TedId,@MaliyetPuan , @KalitePuan , @TeslimatPuan , @MemnuniyetPuan ,@Adet
            END

	    --Ýçteki cursor'un kapatýlmasý
        CLOSE CursorTedId;
        DEALLOCATE CursorTedId;
        FETCH NEXT FROM CursorStokKodu INTO @StokKodu
 END
--Dýþtaki cursor'un kapatýlmasý
CLOSE CursorStokKodu;
DEALLOCATE CursorStokKodu;
 

end






 insert into Malkabul ([StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]  ) 
 values ('D002',3 ,90,80,100,0,'2019-04-20 00:00:00',40),('D001',1,70,80,100,0,'2019-04-20 00:00:00',30),
  ('P01',3 ,90,80,100,0,'2019-04-20 00:00:00',40),('D001',3,90,80,100,0,'2019-04-20 00:00:00',30),
   ('D001',3 ,90,80,50,50,'2019-04-20 00:00:00',40),('D001',3,90,80,50,50,'2019-04-20 00:00:00',30),
    ('P01',3 ,90,80,100,0,'2019-04-20 00:00:00',40),('P01',3,90,80,100,80,'2019-04-20 00:00:00',30),
	 ('D001',3 ,90,80,50,50,'2019-04-20 00:00:00',40),('P01',2,90,80,100,50,'2019-04-20 00:00:00',30),
	 ('P01',3 ,90,80,100,0,'2019-04-20 00:00:00',40),('P01',2,90,80,100,10,'2019-04-20 00:00:00',30)