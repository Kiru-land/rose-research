using Plots
include("./ContinuousModel.jl")

function sample(xs, n=1000)
    return xs[1:n:end]
end

cpwalks = [rwalk_cp(1e6, 1e6, 10000000) for _ in 1:10]
cpspot = map(x -> x[1], cpwalks)
cpvol = map(x -> x[2], cpwalks)
new_r0 = trunc(mean(filter(!isequal(NaN), map(x -> x[3], cpwalks))), digits=2)
new_r1 = trunc(mean(filter(!isequal(NaN), map(x -> x[4], cpwalks))), digits=2)
last_vol = trunc(cpvol[1][end], digits=2)
last_spot = trunc(mean(map(x -> x[end], cpspot)), digits=2)
last_spot_median = trunc(median(map(x -> x[end], cpspot)), digits=2)

plt = plot(sample.(cpspot, 1000), title="CP random walks", xlabel="time", ylabel="spot price", background=:grey22, linewidth=1, palette=:pastel, label=false)
plt = plot(map(x -> log.(x .+ 1), sample.(cpspot, 1000)), title="CP random walks", xlabel="time", ylabel="spot price", background=:grey22, linewidth=1, palette=:pastel, label=false)

plt = plot(sample(cpvol[1], 10), sample(cpspot[1], 10), title="CP random walks", xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[2], 10), sample(cpspot[2], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[3], 10), sample(cpspot[3], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[4], 10), sample(cpspot[4], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[5], 10), sample(cpspot[5], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[6], 10), sample(cpspot[6], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[7], 10), sample(cpspot[7], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[8], 10), sample(cpspot[8], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[9], 10), sample(cpspot[9], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[10], 10), sample(cpspot[10], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[11], 10), sample(cpspot[11], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[12], 10), sample(cpspot[12], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[13], 10), sample(cpspot[13], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[14], 10), sample(cpspot[14], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[15], 10), sample(cpspot[15], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[16], 10), sample(cpspot[16], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[17], 10), sample(cpspot[17], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[18], 10), sample(cpspot[18], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[19], 10), sample(cpspot[19], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(cpvol[20], 10), sample(cpspot[20], 10), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = annotate!(plt, [(0, 0.70, text("mean new_R₀=$(new_r0)", :left, 7, :skyblue))])
plt = annotate!(plt, [(0, 0.65, text("mean new_R₁=$(new_r1)", :left, 7, :skyblue))])
plt = annotate!(plt, [(0, 0.60, text("vol=$(last_vol)", :left, 7, :pink))])


SBCwalks = [rwalk_SBC(1e6, 1e6, 0.01, 1., 10000000) for _ in 1:10]
SBCspot = map(x -> x[1], SBCwalks)
SBCvol = map(x -> x[2], SBCwalks)
new_r0 = trunc(mean(filter(!isequal(NaN), map(x -> x[3].R₀, SBCwalks))), digits=2)
new_r1 = trunc(mean(filter(!isequal(NaN), map(x -> x[3].R₁, SBCwalks))), digits=2)
last_vol = trunc(SBCvol[1][end], digits=2)
last_spot = trunc(mean(map(x -> x[end], SBCspot)), digits=2)
last_spot_median = trunc(median(map(x -> x[end], SBCspot)), digits=2)

plt = plot(sample.(SBCspot, 1000), title="SBC random walks", xlabel="time", ylabel="spot price", background=:grey22, linewidth=1, palette=:pastel, label=false)

plt = plot(sample(SBCvol[1], 1000), sample(SBCspot[1], 1000), title="SBC random walks: α(0)=0.1", xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[2], 1000), sample(SBCspot[2], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[3], 1000), sample(SBCspot[3], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[4], 1000), sample(SBCspot[4], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[5], 1000), sample(SBCspot[5], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[6], 1000), sample(SBCspot[6], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[7], 1000), sample(SBCspot[7], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[8], 1000), sample(SBCspot[8], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[9], 1000), sample(SBCspot[9], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[10], 1000), sample(SBCspot[10], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[11], 1000), sample(SBCspot[11], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[12], 1000), sample(SBCspot[12], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[13], 1000), sample(SBCspot[13], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[14], 1000), sample(SBCspot[14], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[15], 1000), sample(SBCspot[15], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[16], 1000), sample(SBCspot[16], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[17], 1000), sample(SBCspot[17], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[18], 1000), sample(SBCspot[18], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[19], 1000), sample(SBCspot[19], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = plot(plt, sample(SBCvol[20], 1000), sample(SBCspot[20], 1000), xlabel="volume", ylabel="spot price", background=:grey22, linewidth=2, palette=:pastel, label=false)
plt = annotate!(plt, [(0.0, 2.8, text("mean new_R₀=$(new_r0)", :left, 7, :skyblue))])
plt = annotate!(plt, [(0.0, 2.7, text("mean new_R₁=$(new_r1)", :left, 7, :skyblue))])
plt = annotate!(plt, [(0.0, 2.6, text("vol=$(last_vol)", :left, 7, :pink))])


# SBC_const_vol_01 = constant_vol_SBC(1e6, 1e6, 0.01, 1e3, 1000000)
SBC_const_vol_01 = constant_vol_SBC(1e6, 1e6, 0.1, 1., repeat([1e3, -1e3], 500000))
SBC_const_vol_01_spot = SBC_const_vol_01[1]
SBC_const_vol_01_vol = SBC_const_vol_01[2]
SBC_const_vol_01_r1s = SBC_const_vol_01[3]
SBC_const_vol_01_reserves_value = SBC_const_vol_01[4]
new_r0 = trunc(SBC_const_vol_01[5].R₀, digits=2)
new_r1 = trunc(SBC_const_vol_01[5].R₁, digits=2)
last_vol = trunc(SBC_const_vol_01_vol[end], digits=2)

SBC_const_vol_005 = constant_vol_SBC(1e6, 1e6, 0.05, 1., repeat([1e3, -1e3], 500000))
SBC_const_vol_001 = constant_vol_SBC(1e6, 1e6, 0.01, 1., repeat([1e3, -1e3], 500000))
SBC_const_vol_0005 = constant_vol_SBC(1e6, 1e6, 0.005, 1., repeat([1e3, -1e3], 500000))
SBC_const_vol_0001 = constant_vol_SBC(1e6, 1e6, 0.001, 1., repeat([1e3, -1e3], 500000))

plt = plot(sample(SBC_const_vol_01_vol, 10), sample(SBC_const_vol_01_spot, 10), title="SBC uniform volume", yaxis=:log, xlabel="cumulated vol", ylabel="spot price", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.1")
plt = plot(plt, sample(SBC_const_vol_005[2], 10), sample(SBC_const_vol_005[1], 10), xlabel="cumulated vol", ylabel="spot price", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.05")
plt = plot(plt, sample(SBC_const_vol_001[2], 10), sample(SBC_const_vol_001[1], 10), xlabel="cumulated vol", ylabel="spot price", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.01")
plt = plot(plt, sample(SBC_const_vol_0005[2], 10), sample(SBC_const_vol_0005[1], 10), xlabel="cumulated vol", ylabel="spot price", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.005")
plt = plot(plt, sample(SBC_const_vol_0001[2], 10), sample(SBC_const_vol_0001[1], 10), xlabel="cumulated vol", ylabel="spot price", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.001")

∂ₚ(Reserves(1e6, 1e6, 1e5, 1e6, 0.1, 1.0), -100.0)
res = Reserves(1e6, 1e6, 1e5, 1e6, 0.1, 1.0)
prices = [𝑝(res, x) for x in -100:0.1:100]

res(-100.)
plot(-100:0.1:100, prices, title="SBC uniform volume", xlabel="cumulated vol", ylabel="spot price", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.1")

plot(-100:0.1:100, prices, linewidth=2, label=false)
plt = plot(sample(SBC_const_vol_01[2], 10)[2:end], sample(SBC_const_vol_01[3], 10)[2:end], title="SBC uniform volume", xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.1")
plt = plot(plt, sample(SBC_const_vol_005[2], 10)[2:end], sample(SBC_const_vol_005[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.05")
plt = plot(plt, sample(SBC_const_vol_001[2], 10)[2:end], sample(SBC_const_vol_001[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.01")
plt = plot(plt, sample(SBC_const_vol_0005[2], 10)[2:end], sample(SBC_const_vol_0005[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.005")
plt = plot(plt, sample(SBC_const_vol_0001[2], 10)[2:end], sample(SBC_const_vol_0001[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.001")

plt = plot(sample(SBC_const_vol_01[2], 10)[2:end], sample(SBC_const_vol_01[3], 10)[2:end], title="SBC uniform volume", yaxis=:log, xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.1")
plt = plot(plt, sample(SBC_const_vol_005[2], 10)[2:end], sample(SBC_const_vol_005[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.05")
plt = plot(plt, sample(SBC_const_vol_001[2], 10)[2:end], sample(SBC_const_vol_001[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.01")
plt = plot(plt, sample(SBC_const_vol_0005[2], 10)[2:end], sample(SBC_const_vol_0005[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.005")
plt = plot(plt, sample(SBC_const_vol_0001[2], 10)[2:end], sample(SBC_const_vol_0001[3], 10)[2:end], xlabel="cumulated vol", ylabel="R₀ reserve", background=:grey22, linewidth=5, palette=:pastel, label="α(0)=0.001")
